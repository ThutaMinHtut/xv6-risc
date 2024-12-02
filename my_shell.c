#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fcntl.h"
#include "kernel/fs.h"
#define O_APPEND 0x0008
#define MAX_ARGS 16
#define MAX_COMMANDS 16


void parse_args(char *cmd, char *argv[], int *argc) {
  *argc = 0;
  while (*cmd != '\0' && *argc < MAX_ARGS) {
    while (*cmd == ' ' || *cmd == '\t' || *cmd == '\n') {
      *cmd++ = '\0';
    }
    if (*cmd != '\0') {
      if(*cmd == '<' || *cmd == '>' || *cmd == '|'){
        if(*cmd == '|'){
          argv[(*argc)++]=0;
          cmd++;
          }else{
        argv[(*argc)++]=cmd;
            cmd++;
            }
        }else{
          argv[(*argc)++]=cmd;
              while (*cmd != '\0' && *cmd != ' ' && *cmd != '\t' && *cmd != '\n' && *cmd != '<' && *cmd != '>' && *cmd != '|') {
      cmd++;
    }
          }
    }
  }
  argv[*argc] = 0;
}
void execute_command(char *command, char *args[]) {
    int pid = fork();
    if (pid == 0) {
        // Check for output redirection
        int output_redirect = 0;
        int output_fd = -1;
        for (int i = 0; args[i] != 0; i++) {
            if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0) {
                // Output redirection
                output_redirect = 1;
                int flags = O_CREATE | O_WRONLY;
                if (strcmp(args[i], ">>") == 0) {
                    flags |= O_APPEND;
                } else {
                    flags |= O_TRUNC;
                }
                if (args[i + 1] == 0) {
                    printf("Error: missing output file name\n");
                    exit(1);
                }
                output_fd = open(args[i + 1], flags);
                if (output_fd < 0) {
                    printf("Error creating/appending to file %s\n", args[i + 1]);
                    exit(1);
                }
                break;
            }
        }
        int input_redirect = 0;
        int input_fd = -1;
        for (int i = 0; args[i] != 0; i++) {
            if (strcmp(args[i], "<") == 0) {
                input_redirect = 1;
                if (args[i + 1] == 0) {
                    printf("Error: missing input file name\n");
                    exit(1);
                }
                input_fd = open(args[i + 1], O_RDONLY);
                if (input_fd < 0) {
                    printf("Error opening input file %s\n", args[i + 1]);
                    exit(1);
                }
                break;
            }
        }
          if (output_redirect) {
            // Redirect standard output to the output file
            close(1); // Close standard output
            dup(output_fd); // Redirect to the file
            close(output_fd);
            // Remove the output redirection symbols from args
            int filtered_args = 0;
            for (int i = 0; args[i] != 0; i++) {
                if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0) {
                    i += 2; // Skip both the symbol and the filename
                } else {
                    args[filtered_args++] = args[i];
                }
            }
            args[filtered_args] = 0;
        }
          if (input_redirect) {
            // Redirect standard input to the input file
            close(0); // Close standard input
            dup(input_fd); // Redirect from the file
            close(input_fd);
            // Remove the input redirection symbols from args
            int filtered_args = 0;
            for (int i = 0; args[i] != 0; i++) {
                 if (strcmp(args[i], "<") == 0) {
                     i ++; // Skip the symbol 
                 } else {
                     args[filtered_args++] = args[i];
                }
            }
            args[filtered_args] = 0;
        }
        // Execute the command
        if (!output_redirect) {
            exec(command, args);
            printf("Error: command not found: %s\n", command);
            exit(1);
        }else{
          exec(command,args);
          printf("Error: command not found: %s\n",command);
          exit(1);
        }
    } else if (pid < 0) {
        printf("Fork failed\n");
    } else {
        int status;
        wait(&status);
    }
}
void parse_pipe(char *input, char *cmds[MAX_COMMANDS][MAX_ARGS], int *num_cmds) {
    char *start = input; // Pointer to the start of the current command
    char *end = input;   // Pointer to the end of the current command
    while (*end != '\0') {
        if (*end == '|') {
            if (start != end) {
                int argc = 0;
                while (start < end && argc < MAX_ARGS - 1) {
                    while (*start == ' ' || *start == '\t') {
                        start++;
                    }
                    cmds[*num_cmds][argc++] = start;
                    while (*start != ' ' && *start != '\t' && *start != '\0') {
                        start++;
                    }
                    if (*start == '\0') {
                        break;
                    }
                    *start = '\0';
                    start++;
                }
                cmds[*num_cmds][argc] = 0;
                (*num_cmds)++;
            }
            start = end + 1;
        }
        end++;
    }
    if (start != end) {
        int argc = 0;
        while (start < end && argc < MAX_ARGS - 1) {
            while (*start == ' ' || *start == '\t') {
                start++;
            }
            cmds[*num_cmds][argc++] = start;
            while (*start != ' ' && *start != '\t' && *start != '\0') {
                start++;
            }
            if (*start == '\0') {
                break;
            }
            *start = '\0';
            start++;
        }
        cmds[*num_cmds][argc] =0;
        (*num_cmds)++;
    }
}
void execute_pipe(char *left_cmd[], char *right_cmd[]) {

    int left_pid, right_pid;
    int pipe_fd[2];
    if (pipe(pipe_fd) == -1) {
        printf("pipe");
        exit(1);
    }
    left_pid = fork();
    if (left_pid < 0) {
        printf("fork");
        exit(1);
    } else if (left_pid == 0) {
        // Child process for the left command
        close(pipe_fd[0]); // Close the read end of the pipe
        close(1); // Close standard output
        dup(pipe_fd[1]); // Redirect to the write end of the pipe
        close(pipe_fd[1]); // Close the write end of the pipe
        exec(left_cmd[0], left_cmd);
        exit(0);
    }
    close(pipe_fd[1]); // Close the write end of the pipe in the parent process
    right_pid = fork();
    if (right_pid < 0) {
        printf("fork");
        exit(1);
    } else if (right_pid == 0) {
        // Child process for the right command
        close(pipe_fd[1]); // Close the write end of the pipe
        close(0); // Close standard input
        dup(pipe_fd[0]); // Redirect from the read end of the pipe
        close(pipe_fd[0]); // Close the read end of the pipe
        exec(right_cmd[0], right_cmd);
        exit(0);
    }
    // Parent process
    close(pipe_fd[0]); // Close the read end of the pipe
    close(pipe_fd[1]); // Close the write end of the pipe
    // Wait for both child processes to finish
    int status;
    wait(&status);
    wait(&status);
}

int main() {
    char line[512];
    while (1) {
        printf(">>> ");
        gets(line, sizeof(line));
        int pipe_found = 0;
        for (int i = 0; line[i] != '\0'; i++) {
            if (line[i] == '|') {
                pipe_found = 1;
            }
        }
        if (pipe_found) {
            char *left_cmd[MAX_ARGS];
            char *right_cmd[MAX_ARGS];
            int left_args = 0;
            int right_args = 0;
            // Split the input into left and right commands based on the pipe character '|'
            char *start = line;
            char *end = line;
            while (*end != '\0') {
                if (*end == '|') {
                    if (start != end) {
                        *end = '\0';
                        if (left_args == 0) {
                            left_cmd[0] = start;
                            left_args = 1;
                        } else {
                            right_cmd[0] = start;
                            right_args = 1;
                        }
                        start = end + 1;
                    }
                }
                end++;
            }
            if (start != end) {
                if (left_args == 0) {
                    left_cmd[0] = start;
                    left_args = 1;
                } else {
                    right_cmd[0] = start;
                    right_args = 1;
                }
            }
            left_cmd[left_args] = 0;
            right_cmd[right_args] = 0;
            // Execute the left and right commands
            execute_pipe(left_cmd, right_cmd);
        } else {
            // The input command does not contain a pipe '|'
            char *args[MAX_ARGS];
            int num_args = 0;
            parse_args(line, args, &num_args);
            if (num_args > 0) {
                if (strcmp(args[0], "cd") == 0) {
                    if (num_args != 2) {
                        printf("Usage: cd <directory>\n");
                    } else if (chdir(args[1]) < 0) {
                        printf("Error: cannot change directory to %s\n", args[1]);
                    }
                } else if (strcmp(args[0], "q") == 0) {
                    exit(0);
                } else {
                    execute_command(args[0], args);
                }
            }
        }
    }
    exit(0);
}
