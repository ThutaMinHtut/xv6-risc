
user/_my_shell:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <parse_args>:
#define O_APPEND 0x0008
#define MAX_ARGS 16
#define MAX_COMMANDS 16


void parse_args(char *cmd, char *argv[], int *argc) {
   0:	1141                	addi	sp,sp,-16
   2:	e422                	sd	s0,8(sp)
   4:	0800                	addi	s0,sp,16
  *argc = 0;
   6:	00062023          	sw	zero,0(a2)
  while (*cmd != '\0' && *argc < MAX_ARGS) {
   a:	48bd                	li	a7,15
    while (*cmd == ' ' || *cmd == '\t' || *cmd == '\n') {
   c:	02000693          	li	a3,32
  10:	4805                	li	a6,1
      *cmd++ = '\0';
    }
    if (*cmd != '\0') {
      if(*cmd == '<' || *cmd == '>' || *cmd == '|'){
  12:	03c00e13          	li	t3,60
  16:	07c00313          	li	t1,124
  1a:	03e00f93          	li	t6,62
  1e:	4f21                	li	t5,8
  20:	00001e97          	auipc	t4,0x1
  24:	f90e8e93          	addi	t4,t4,-112 # fb0 <malloc+0xec>
  while (*cmd != '\0' && *argc < MAX_ARGS) {
  28:	a839                	j	46 <parse_args+0x46>
      *cmd++ = '\0';
  2a:	0505                	addi	a0,a0,1
  2c:	fe050fa3          	sb	zero,-1(a0)
    while (*cmd == ' ' || *cmd == '\t' || *cmd == '\n') {
  30:	00054783          	lbu	a5,0(a0)
  34:	fed78be3          	beq	a5,a3,2a <parse_args+0x2a>
  38:	ff77871b          	addiw	a4,a5,-9
  3c:	0ff77713          	zext.b	a4,a4
  40:	fee875e3          	bgeu	a6,a4,2a <parse_args+0x2a>
    if (*cmd != '\0') {
  44:	ef99                	bnez	a5,62 <parse_args+0x62>
  while (*cmd != '\0' && *argc < MAX_ARGS) {
  46:	00054783          	lbu	a5,0(a0)
  4a:	c781                	beqz	a5,52 <parse_args+0x52>
  4c:	421c                	lw	a5,0(a2)
  4e:	fef8d1e3          	bge	a7,a5,30 <parse_args+0x30>
      cmd++;
    }
          }
    }
  }
  argv[*argc] = 0;
  52:	421c                	lw	a5,0(a2)
  54:	078e                	slli	a5,a5,0x3
  56:	95be                	add	a1,a1,a5
  58:	0005b023          	sd	zero,0(a1)
}
  5c:	6422                	ld	s0,8(sp)
  5e:	0141                	addi	sp,sp,16
  60:	8082                	ret
      if(*cmd == '<' || *cmd == '>' || *cmd == '|'){
  62:	0fd7f713          	andi	a4,a5,253
  66:	01c70e63          	beq	a4,t3,82 <parse_args+0x82>
  6a:	02679563          	bne	a5,t1,94 <parse_args+0x94>
          argv[(*argc)++]=0;
  6e:	421c                	lw	a5,0(a2)
  70:	0017871b          	addiw	a4,a5,1
  74:	c218                	sw	a4,0(a2)
  76:	078e                	slli	a5,a5,0x3
  78:	97ae                	add	a5,a5,a1
  7a:	0007b023          	sd	zero,0(a5)
          cmd++;
  7e:	0505                	addi	a0,a0,1
  80:	b7d9                	j	46 <parse_args+0x46>
        argv[(*argc)++]=cmd;
  82:	421c                	lw	a5,0(a2)
  84:	0017871b          	addiw	a4,a5,1
  88:	c218                	sw	a4,0(a2)
  8a:	078e                	slli	a5,a5,0x3
  8c:	97ae                	add	a5,a5,a1
  8e:	e388                	sd	a0,0(a5)
            cmd++;
  90:	0505                	addi	a0,a0,1
  92:	bf55                	j	46 <parse_args+0x46>
          argv[(*argc)++]=cmd;
  94:	421c                	lw	a5,0(a2)
  96:	0017871b          	addiw	a4,a5,1
  9a:	c218                	sw	a4,0(a2)
  9c:	078e                	slli	a5,a5,0x3
  9e:	97ae                	add	a5,a5,a1
  a0:	e388                	sd	a0,0(a5)
              while (*cmd != '\0' && *cmd != ' ' && *cmd != '\t' && *cmd != '\n' && *cmd != '<' && *cmd != '>' && *cmd != '|') {
  a2:	00054783          	lbu	a5,0(a0)
  a6:	eb91                	bnez	a5,ba <parse_args+0xba>
  a8:	bf79                	j	46 <parse_args+0x46>
  aa:	f9f78ee3          	beq	a5,t6,46 <parse_args+0x46>
  ae:	f8678ce3          	beq	a5,t1,46 <parse_args+0x46>
      cmd++;
  b2:	0505                	addi	a0,a0,1
              while (*cmd != '\0' && *cmd != ' ' && *cmd != '\t' && *cmd != '\n' && *cmd != '<' && *cmd != '>' && *cmd != '|') {
  b4:	00054783          	lbu	a5,0(a0)
  b8:	d7d9                	beqz	a5,46 <parse_args+0x46>
  ba:	fefe68e3          	bltu	t3,a5,aa <parse_args+0xaa>
  be:	feff7ae3          	bgeu	t5,a5,b2 <parse_args+0xb2>
  c2:	000eb703          	ld	a4,0(t4)
  c6:	00f757b3          	srl	a5,a4,a5
  ca:	8b85                	andi	a5,a5,1
  cc:	d3fd                	beqz	a5,b2 <parse_args+0xb2>
  ce:	bfa5                	j	46 <parse_args+0x46>

00000000000000d0 <execute_command>:
void execute_command(char *command, char *args[]) {
  d0:	7119                	addi	sp,sp,-128
  d2:	fc86                	sd	ra,120(sp)
  d4:	f8a2                	sd	s0,112(sp)
  d6:	f4a6                	sd	s1,104(sp)
  d8:	f0ca                	sd	s2,96(sp)
  da:	ecce                	sd	s3,88(sp)
  dc:	e8d2                	sd	s4,80(sp)
  de:	e4d6                	sd	s5,72(sp)
  e0:	e0da                	sd	s6,64(sp)
  e2:	fc5e                	sd	s7,56(sp)
  e4:	f862                	sd	s8,48(sp)
  e6:	f466                	sd	s9,40(sp)
  e8:	f06a                	sd	s10,32(sp)
  ea:	ec6e                	sd	s11,24(sp)
  ec:	0100                	addi	s0,sp,128
  ee:	8aaa                	mv	s5,a0
  f0:	89ae                	mv	s3,a1
    int pid = fork();
  f2:	00001097          	auipc	ra,0x1
  f6:	998080e7          	jalr	-1640(ra) # a8a <fork>
  fa:	8a2a                	mv	s4,a0
    if (pid == 0) {
  fc:	2a051463          	bnez	a0,3a4 <execute_command+0x2d4>
        // Check for output redirection
        int output_redirect = 0;
        int output_fd = -1;
        for (int i = 0; args[i] != 0; i++) {
 100:	0009b503          	ld	a0,0(s3)
 104:	c155                	beqz	a0,1a8 <execute_command+0xd8>
 106:	84ce                	mv	s1,s3
 108:	4901                	li	s2,0
            if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0) {
 10a:	00001b17          	auipc	s6,0x1
 10e:	eb6b0b13          	addi	s6,s6,-330 # fc0 <malloc+0xfc>
 112:	00001b97          	auipc	s7,0x1
 116:	eb6b8b93          	addi	s7,s7,-330 # fc8 <malloc+0x104>
 11a:	85da                	mv	a1,s6
 11c:	00000097          	auipc	ra,0x0
 120:	726080e7          	jalr	1830(ra) # 842 <strcmp>
 124:	cd19                	beqz	a0,142 <execute_command+0x72>
 126:	85de                	mv	a1,s7
 128:	6088                	ld	a0,0(s1)
 12a:	00000097          	auipc	ra,0x0
 12e:	718080e7          	jalr	1816(ra) # 842 <strcmp>
 132:	c901                	beqz	a0,142 <execute_command+0x72>
        for (int i = 0; args[i] != 0; i++) {
 134:	04a1                	addi	s1,s1,8
 136:	6088                	ld	a0,0(s1)
 138:	0905                	addi	s2,s2,1
 13a:	f165                	bnez	a0,11a <execute_command+0x4a>
        int output_redirect = 0;
 13c:	8bd2                	mv	s7,s4
        int output_fd = -1;
 13e:	5b7d                	li	s6,-1
 140:	a82d                	j	17a <execute_command+0xaa>
                // Output redirection
                output_redirect = 1;
                int flags = O_CREATE | O_WRONLY;
                if (strcmp(args[i], ">>") == 0) {
 142:	00001597          	auipc	a1,0x1
 146:	e8658593          	addi	a1,a1,-378 # fc8 <malloc+0x104>
 14a:	6088                	ld	a0,0(s1)
 14c:	00000097          	auipc	ra,0x0
 150:	6f6080e7          	jalr	1782(ra) # 842 <strcmp>
                    flags |= O_APPEND;
 154:	20900593          	li	a1,521
                if (strcmp(args[i], ">>") == 0) {
 158:	c119                	beqz	a0,15e <execute_command+0x8e>
                } else {
                    flags |= O_TRUNC;
 15a:	60100593          	li	a1,1537
                }
                if (args[i + 1] == 0) {
 15e:	0905                	addi	s2,s2,1
 160:	090e                	slli	s2,s2,0x3
 162:	994e                	add	s2,s2,s3
 164:	00093503          	ld	a0,0(s2)
 168:	c525                	beqz	a0,1d0 <execute_command+0x100>
                    printf("Error: missing output file name\n");
                    exit(1);
                }
                output_fd = open(args[i + 1], flags);
 16a:	00001097          	auipc	ra,0x1
 16e:	968080e7          	jalr	-1688(ra) # ad2 <open>
 172:	8b2a                	mv	s6,a0
                output_redirect = 1;
 174:	4b85                	li	s7,1
                if (output_fd < 0) {
 176:	06054a63          	bltz	a0,1ea <execute_command+0x11a>
                break;
            }
        }
        int input_redirect = 0;
        int input_fd = -1;
        for (int i = 0; args[i] != 0; i++) {
 17a:	0009b503          	ld	a0,0(s3)
 17e:	c11d                	beqz	a0,1a4 <execute_command+0xd4>
 180:	00898493          	addi	s1,s3,8
 184:	4901                	li	s2,0
            if (strcmp(args[i], "<") == 0) {
 186:	00001c17          	auipc	s8,0x1
 18a:	e9ac0c13          	addi	s8,s8,-358 # 1020 <malloc+0x15c>
 18e:	85e2                	mv	a1,s8
 190:	00000097          	auipc	ra,0x0
 194:	6b2080e7          	jalr	1714(ra) # 842 <strcmp>
 198:	c925                	beqz	a0,208 <execute_command+0x138>
        for (int i = 0; args[i] != 0; i++) {
 19a:	0905                	addi	s2,s2,1
 19c:	04a1                	addi	s1,s1,8
 19e:	ff84b503          	ld	a0,-8(s1)
 1a2:	f575                	bnez	a0,18e <execute_command+0xbe>
                    exit(1);
                }
                break;
            }
        }
          if (output_redirect) {
 1a4:	0e0b9863          	bnez	s7,294 <execute_command+0x1c4>
            }
            args[filtered_args] = 0;
        }
        // Execute the command
        if (!output_redirect) {
            exec(command, args);
 1a8:	85ce                	mv	a1,s3
 1aa:	8556                	mv	a0,s5
 1ac:	00001097          	auipc	ra,0x1
 1b0:	91e080e7          	jalr	-1762(ra) # aca <exec>
            printf("Error: command not found: %s\n", command);
 1b4:	85d6                	mv	a1,s5
 1b6:	00001517          	auipc	a0,0x1
 1ba:	eb250513          	addi	a0,a0,-334 # 1068 <malloc+0x1a4>
 1be:	00001097          	auipc	ra,0x1
 1c2:	c4e080e7          	jalr	-946(ra) # e0c <printf>
            exit(1);
 1c6:	4505                	li	a0,1
 1c8:	00001097          	auipc	ra,0x1
 1cc:	8ca080e7          	jalr	-1846(ra) # a92 <exit>
                    printf("Error: missing output file name\n");
 1d0:	00001517          	auipc	a0,0x1
 1d4:	e0050513          	addi	a0,a0,-512 # fd0 <malloc+0x10c>
 1d8:	00001097          	auipc	ra,0x1
 1dc:	c34080e7          	jalr	-972(ra) # e0c <printf>
                    exit(1);
 1e0:	4505                	li	a0,1
 1e2:	00001097          	auipc	ra,0x1
 1e6:	8b0080e7          	jalr	-1872(ra) # a92 <exit>
                    printf("Error creating/appending to file %s\n", args[i + 1]);
 1ea:	00093583          	ld	a1,0(s2)
 1ee:	00001517          	auipc	a0,0x1
 1f2:	e0a50513          	addi	a0,a0,-502 # ff8 <malloc+0x134>
 1f6:	00001097          	auipc	ra,0x1
 1fa:	c16080e7          	jalr	-1002(ra) # e0c <printf>
                    exit(1);
 1fe:	4505                	li	a0,1
 200:	00001097          	auipc	ra,0x1
 204:	892080e7          	jalr	-1902(ra) # a92 <exit>
                if (args[i + 1] == 0) {
 208:	00190493          	addi	s1,s2,1
 20c:	048e                	slli	s1,s1,0x3
 20e:	94ce                	add	s1,s1,s3
 210:	6088                	ld	a0,0(s1)
 212:	c531                	beqz	a0,25e <execute_command+0x18e>
                input_fd = open(args[i + 1], O_RDONLY);
 214:	4581                	li	a1,0
 216:	00001097          	auipc	ra,0x1
 21a:	8bc080e7          	jalr	-1860(ra) # ad2 <open>
 21e:	8caa                	mv	s9,a0
                if (input_fd < 0) {
 220:	04054c63          	bltz	a0,278 <execute_command+0x1a8>
                input_redirect = 1;
 224:	8d5e                	mv	s10,s7
          if (output_redirect) {
 226:	060b9963          	bnez	s7,298 <execute_command+0x1c8>
            close(0); // Close standard input
 22a:	4501                	li	a0,0
 22c:	00001097          	auipc	ra,0x1
 230:	88e080e7          	jalr	-1906(ra) # aba <close>
            dup(input_fd); // Redirect from the file
 234:	8566                	mv	a0,s9
 236:	00001097          	auipc	ra,0x1
 23a:	8d4080e7          	jalr	-1836(ra) # b0a <dup>
            close(input_fd);
 23e:	8566                	mv	a0,s9
 240:	00001097          	auipc	ra,0x1
 244:	87a080e7          	jalr	-1926(ra) # aba <close>
            for (int i = 0; args[i] != 0; i++) {
 248:	0009b503          	ld	a0,0(s3)
 24c:	18050c63          	beqz	a0,3e4 <execute_command+0x314>
 250:	8952                	mv	s2,s4
 252:	84ce                	mv	s1,s3
                 if (strcmp(args[i], "<") == 0) {
 254:	00001b17          	auipc	s6,0x1
 258:	dccb0b13          	addi	s6,s6,-564 # 1020 <malloc+0x15c>
 25c:	a211                	j	360 <execute_command+0x290>
                    printf("Error: missing input file name\n");
 25e:	00001517          	auipc	a0,0x1
 262:	dca50513          	addi	a0,a0,-566 # 1028 <malloc+0x164>
 266:	00001097          	auipc	ra,0x1
 26a:	ba6080e7          	jalr	-1114(ra) # e0c <printf>
                    exit(1);
 26e:	4505                	li	a0,1
 270:	00001097          	auipc	ra,0x1
 274:	822080e7          	jalr	-2014(ra) # a92 <exit>
                    printf("Error opening input file %s\n", args[i + 1]);
 278:	608c                	ld	a1,0(s1)
 27a:	00001517          	auipc	a0,0x1
 27e:	dce50513          	addi	a0,a0,-562 # 1048 <malloc+0x184>
 282:	00001097          	auipc	ra,0x1
 286:	b8a080e7          	jalr	-1142(ra) # e0c <printf>
                    exit(1);
 28a:	4505                	li	a0,1
 28c:	00001097          	auipc	ra,0x1
 290:	806080e7          	jalr	-2042(ra) # a92 <exit>
          if (output_redirect) {
 294:	8d52                	mv	s10,s4
 296:	5cfd                	li	s9,-1
            close(1); // Close standard output
 298:	4505                	li	a0,1
 29a:	00001097          	auipc	ra,0x1
 29e:	820080e7          	jalr	-2016(ra) # aba <close>
            dup(output_fd); // Redirect to the file
 2a2:	855a                	mv	a0,s6
 2a4:	00001097          	auipc	ra,0x1
 2a8:	866080e7          	jalr	-1946(ra) # b0a <dup>
            close(output_fd);
 2ac:	855a                	mv	a0,s6
 2ae:	00001097          	auipc	ra,0x1
 2b2:	80c080e7          	jalr	-2036(ra) # aba <close>
            for (int i = 0; args[i] != 0; i++) {
 2b6:	0009b503          	ld	a0,0(s3)
 2ba:	c939                	beqz	a0,310 <execute_command+0x240>
 2bc:	84d2                	mv	s1,s4
            int filtered_args = 0;
 2be:	8b52                	mv	s6,s4
            for (int i = 0; args[i] != 0; i++) {
 2c0:	894e                	mv	s2,s3
                if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0) {
 2c2:	00001c17          	auipc	s8,0x1
 2c6:	cfec0c13          	addi	s8,s8,-770 # fc0 <malloc+0xfc>
 2ca:	00001d97          	auipc	s11,0x1
 2ce:	cfed8d93          	addi	s11,s11,-770 # fc8 <malloc+0x104>
 2d2:	a809                	j	2e4 <execute_command+0x214>
                    i += 2; // Skip both the symbol and the filename
 2d4:	2489                	addiw	s1,s1,2
            for (int i = 0; args[i] != 0; i++) {
 2d6:	2485                	addiw	s1,s1,1
 2d8:	00349913          	slli	s2,s1,0x3
 2dc:	994e                	add	s2,s2,s3
 2de:	00093503          	ld	a0,0(s2)
 2e2:	c905                	beqz	a0,312 <execute_command+0x242>
                if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0) {
 2e4:	85e2                	mv	a1,s8
 2e6:	00000097          	auipc	ra,0x0
 2ea:	55c080e7          	jalr	1372(ra) # 842 <strcmp>
 2ee:	d17d                	beqz	a0,2d4 <execute_command+0x204>
 2f0:	85ee                	mv	a1,s11
 2f2:	00093503          	ld	a0,0(s2)
 2f6:	00000097          	auipc	ra,0x0
 2fa:	54c080e7          	jalr	1356(ra) # 842 <strcmp>
 2fe:	d979                	beqz	a0,2d4 <execute_command+0x204>
                    args[filtered_args++] = args[i];
 300:	00093703          	ld	a4,0(s2)
 304:	003b1793          	slli	a5,s6,0x3
 308:	97ce                	add	a5,a5,s3
 30a:	e398                	sd	a4,0(a5)
 30c:	2b05                	addiw	s6,s6,1
 30e:	b7e1                	j	2d6 <execute_command+0x206>
            int filtered_args = 0;
 310:	8b52                	mv	s6,s4
            args[filtered_args] = 0;
 312:	0b0e                	slli	s6,s6,0x3
 314:	9b4e                	add	s6,s6,s3
 316:	000b3023          	sd	zero,0(s6)
          if (input_redirect) {
 31a:	060d0163          	beqz	s10,37c <execute_command+0x2ac>
            close(0); // Close standard input
 31e:	4501                	li	a0,0
 320:	00000097          	auipc	ra,0x0
 324:	79a080e7          	jalr	1946(ra) # aba <close>
            dup(input_fd); // Redirect from the file
 328:	8566                	mv	a0,s9
 32a:	00000097          	auipc	ra,0x0
 32e:	7e0080e7          	jalr	2016(ra) # b0a <dup>
            close(input_fd);
 332:	8566                	mv	a0,s9
 334:	00000097          	auipc	ra,0x0
 338:	786080e7          	jalr	1926(ra) # aba <close>
            for (int i = 0; args[i] != 0; i++) {
 33c:	0009b503          	ld	a0,0(s3)
 340:	f901                	bnez	a0,250 <execute_command+0x180>
            args[filtered_args] = 0;
 342:	0009b023          	sd	zero,0(s3)
        if (!output_redirect) {
 346:	a81d                	j	37c <execute_command+0x2ac>
                     args[filtered_args++] = args[i];
 348:	6098                	ld	a4,0(s1)
 34a:	003a1793          	slli	a5,s4,0x3
 34e:	97ce                	add	a5,a5,s3
 350:	e398                	sd	a4,0(a5)
 352:	2a05                	addiw	s4,s4,1
            for (int i = 0; args[i] != 0; i++) {
 354:	2905                	addiw	s2,s2,1
 356:	00391493          	slli	s1,s2,0x3
 35a:	94ce                	add	s1,s1,s3
 35c:	6088                	ld	a0,0(s1)
 35e:	c909                	beqz	a0,370 <execute_command+0x2a0>
                 if (strcmp(args[i], "<") == 0) {
 360:	85da                	mv	a1,s6
 362:	00000097          	auipc	ra,0x0
 366:	4e0080e7          	jalr	1248(ra) # 842 <strcmp>
 36a:	fd79                	bnez	a0,348 <execute_command+0x278>
                     i ++; // Skip the symbol 
 36c:	2905                	addiw	s2,s2,1
 36e:	b7dd                	j	354 <execute_command+0x284>
            args[filtered_args] = 0;
 370:	0a0e                	slli	s4,s4,0x3
 372:	9a4e                	add	s4,s4,s3
 374:	000a3023          	sd	zero,0(s4)
        if (!output_redirect) {
 378:	e20b88e3          	beqz	s7,1a8 <execute_command+0xd8>
        }else{
          exec(command,args);
 37c:	85ce                	mv	a1,s3
 37e:	8556                	mv	a0,s5
 380:	00000097          	auipc	ra,0x0
 384:	74a080e7          	jalr	1866(ra) # aca <exec>
          printf("Error: command not found: %s\n",command);
 388:	85d6                	mv	a1,s5
 38a:	00001517          	auipc	a0,0x1
 38e:	cde50513          	addi	a0,a0,-802 # 1068 <malloc+0x1a4>
 392:	00001097          	auipc	ra,0x1
 396:	a7a080e7          	jalr	-1414(ra) # e0c <printf>
          exit(1);
 39a:	4505                	li	a0,1
 39c:	00000097          	auipc	ra,0x0
 3a0:	6f6080e7          	jalr	1782(ra) # a92 <exit>
        }
    } else if (pid < 0) {
 3a4:	02054763          	bltz	a0,3d2 <execute_command+0x302>
        printf("Fork failed\n");
    } else {
        int status;
        wait(&status);
 3a8:	f8c40513          	addi	a0,s0,-116
 3ac:	00000097          	auipc	ra,0x0
 3b0:	6ee080e7          	jalr	1774(ra) # a9a <wait>
    }
}
 3b4:	70e6                	ld	ra,120(sp)
 3b6:	7446                	ld	s0,112(sp)
 3b8:	74a6                	ld	s1,104(sp)
 3ba:	7906                	ld	s2,96(sp)
 3bc:	69e6                	ld	s3,88(sp)
 3be:	6a46                	ld	s4,80(sp)
 3c0:	6aa6                	ld	s5,72(sp)
 3c2:	6b06                	ld	s6,64(sp)
 3c4:	7be2                	ld	s7,56(sp)
 3c6:	7c42                	ld	s8,48(sp)
 3c8:	7ca2                	ld	s9,40(sp)
 3ca:	7d02                	ld	s10,32(sp)
 3cc:	6de2                	ld	s11,24(sp)
 3ce:	6109                	addi	sp,sp,128
 3d0:	8082                	ret
        printf("Fork failed\n");
 3d2:	00001517          	auipc	a0,0x1
 3d6:	cb650513          	addi	a0,a0,-842 # 1088 <malloc+0x1c4>
 3da:	00001097          	auipc	ra,0x1
 3de:	a32080e7          	jalr	-1486(ra) # e0c <printf>
 3e2:	bfc9                	j	3b4 <execute_command+0x2e4>
            args[filtered_args] = 0;
 3e4:	0009b023          	sd	zero,0(s3)
        if (!output_redirect) {
 3e8:	b3c1                	j	1a8 <execute_command+0xd8>

00000000000003ea <parse_pipe>:
void parse_pipe(char *input, char *cmds[MAX_COMMANDS][MAX_ARGS], int *num_cmds) {
 3ea:	1141                	addi	sp,sp,-16
 3ec:	e422                	sd	s0,8(sp)
 3ee:	0800                	addi	s0,sp,16
    char *start = input; // Pointer to the start of the current command
    char *end = input;   // Pointer to the end of the current command
    while (*end != '\0') {
 3f0:	00054783          	lbu	a5,0(a0)
 3f4:	cbdd                	beqz	a5,4aa <parse_pipe+0xc0>
    char *end = input;   // Pointer to the end of the current command
 3f6:	882a                	mv	a6,a0
        if (*end == '|') {
 3f8:	07c00e93          	li	t4,124
            if (start != end) {
                int argc = 0;
 3fc:	4f01                	li	t5,0
                while (start < end && argc < MAX_ARGS - 1) {
                    while (*start == ' ' || *start == '\t') {
 3fe:	02000713          	li	a4,32
 402:	46a5                	li	a3,9
                while (start < end && argc < MAX_ARGS - 1) {
 404:	4e3d                	li	t3,15
 406:	a0ad                	j	470 <parse_pipe+0x86>
                        start++;
 408:	0505                	addi	a0,a0,1
                    while (*start == ' ' || *start == '\t') {
 40a:	00054783          	lbu	a5,0(a0)
 40e:	fee78de3          	beq	a5,a4,408 <parse_pipe+0x1e>
 412:	fed78be3          	beq	a5,a3,408 <parse_pipe+0x1e>
                    }
                    cmds[*num_cmds][argc++] = start;
 416:	0018831b          	addiw	t1,a7,1
 41a:	421c                	lw	a5,0(a2)
 41c:	079e                	slli	a5,a5,0x7
 41e:	97ae                	add	a5,a5,a1
 420:	088e                	slli	a7,a7,0x3
 422:	97c6                	add	a5,a5,a7
 424:	e388                	sd	a0,0(a5)
                    while (*start != ' ' && *start != '\t' && *start != '\0') {
 426:	00054783          	lbu	a5,0(a0)
 42a:	00e78a63          	beq	a5,a4,43e <parse_pipe+0x54>
 42e:	00d78863          	beq	a5,a3,43e <parse_pipe+0x54>
 432:	cf99                	beqz	a5,450 <parse_pipe+0x66>
                        start++;
 434:	0505                	addi	a0,a0,1
                    while (*start != ' ' && *start != '\t' && *start != '\0') {
 436:	00054783          	lbu	a5,0(a0)
 43a:	fee79ae3          	bne	a5,a4,42e <parse_pipe+0x44>
                    }
                    if (*start == '\0') {
                        break;
                    }
                    *start = '\0';
 43e:	00050023          	sb	zero,0(a0)
                    start++;
 442:	0505                	addi	a0,a0,1
                while (start < end && argc < MAX_ARGS - 1) {
 444:	01057663          	bgeu	a0,a6,450 <parse_pipe+0x66>
 448:	01c30463          	beq	t1,t3,450 <parse_pipe+0x66>
                    cmds[*num_cmds][argc++] = start;
 44c:	889a                	mv	a7,t1
 44e:	bf75                	j	40a <parse_pipe+0x20>
                }
                cmds[*num_cmds][argc] = 0;
 450:	421c                	lw	a5,0(a2)
 452:	079e                	slli	a5,a5,0x7
 454:	97ae                	add	a5,a5,a1
 456:	030e                	slli	t1,t1,0x3
 458:	979a                	add	a5,a5,t1
 45a:	0007b023          	sd	zero,0(a5)
                (*num_cmds)++;
 45e:	421c                	lw	a5,0(a2)
 460:	2785                	addiw	a5,a5,1
 462:	c21c                	sw	a5,0(a2)
            }
            start = end + 1;
 464:	00180513          	addi	a0,a6,1
        }
        end++;
 468:	0805                	addi	a6,a6,1
    while (*end != '\0') {
 46a:	00084783          	lbu	a5,0(a6)
 46e:	cb91                	beqz	a5,482 <parse_pipe+0x98>
        if (*end == '|') {
 470:	ffd79ce3          	bne	a5,t4,468 <parse_pipe+0x7e>
            if (start != end) {
 474:	ff0508e3          	beq	a0,a6,464 <parse_pipe+0x7a>
                int argc = 0;
 478:	88fa                	mv	a7,t5
 47a:	837a                	mv	t1,t5
                while (start < end && argc < MAX_ARGS - 1) {
 47c:	f90567e3          	bltu	a0,a6,40a <parse_pipe+0x20>
 480:	bfc1                	j	450 <parse_pipe+0x66>
    }
    if (start != end) {
 482:	03050463          	beq	a0,a6,4aa <parse_pipe+0xc0>
        int argc = 0;
 486:	4881                	li	a7,0
        while (start < end && argc < MAX_ARGS - 1) {
            while (*start == ' ' || *start == '\t') {
 488:	02000713          	li	a4,32
 48c:	46a5                	li	a3,9
        while (start < end && argc < MAX_ARGS - 1) {
 48e:	4e3d                	li	t3,15
        int argc = 0;
 490:	4301                	li	t1,0
        while (start < end && argc < MAX_ARGS - 1) {
 492:	03056063          	bltu	a0,a6,4b2 <parse_pipe+0xc8>
                break;
            }
            *start = '\0';
            start++;
        }
        cmds[*num_cmds][argc] =0;
 496:	421c                	lw	a5,0(a2)
 498:	079e                	slli	a5,a5,0x7
 49a:	97ae                	add	a5,a5,a1
 49c:	030e                	slli	t1,t1,0x3
 49e:	979a                	add	a5,a5,t1
 4a0:	0007b023          	sd	zero,0(a5)
        (*num_cmds)++;
 4a4:	421c                	lw	a5,0(a2)
 4a6:	2785                	addiw	a5,a5,1
 4a8:	c21c                	sw	a5,0(a2)
    }
}
 4aa:	6422                	ld	s0,8(sp)
 4ac:	0141                	addi	sp,sp,16
 4ae:	8082                	ret
                start++;
 4b0:	0505                	addi	a0,a0,1
            while (*start == ' ' || *start == '\t') {
 4b2:	00054783          	lbu	a5,0(a0)
 4b6:	fee78de3          	beq	a5,a4,4b0 <parse_pipe+0xc6>
 4ba:	fed78be3          	beq	a5,a3,4b0 <parse_pipe+0xc6>
            cmds[*num_cmds][argc++] = start;
 4be:	0018831b          	addiw	t1,a7,1
 4c2:	421c                	lw	a5,0(a2)
 4c4:	079e                	slli	a5,a5,0x7
 4c6:	97ae                	add	a5,a5,a1
 4c8:	088e                	slli	a7,a7,0x3
 4ca:	97c6                	add	a5,a5,a7
 4cc:	e388                	sd	a0,0(a5)
            while (*start != ' ' && *start != '\t' && *start != '\0') {
 4ce:	00054783          	lbu	a5,0(a0)
 4d2:	00e78a63          	beq	a5,a4,4e6 <parse_pipe+0xfc>
 4d6:	00d78863          	beq	a5,a3,4e6 <parse_pipe+0xfc>
 4da:	dfd5                	beqz	a5,496 <parse_pipe+0xac>
                start++;
 4dc:	0505                	addi	a0,a0,1
            while (*start != ' ' && *start != '\t' && *start != '\0') {
 4de:	00054783          	lbu	a5,0(a0)
 4e2:	fee79ae3          	bne	a5,a4,4d6 <parse_pipe+0xec>
            *start = '\0';
 4e6:	00050023          	sb	zero,0(a0)
            start++;
 4ea:	0505                	addi	a0,a0,1
        while (start < end && argc < MAX_ARGS - 1) {
 4ec:	fb0575e3          	bgeu	a0,a6,496 <parse_pipe+0xac>
 4f0:	fbc303e3          	beq	t1,t3,496 <parse_pipe+0xac>
            cmds[*num_cmds][argc++] = start;
 4f4:	889a                	mv	a7,t1
 4f6:	bf75                	j	4b2 <parse_pipe+0xc8>

00000000000004f8 <execute_pipe>:
void execute_pipe(char *left_cmd[], char *right_cmd[]) {
 4f8:	7179                	addi	sp,sp,-48
 4fa:	f406                	sd	ra,40(sp)
 4fc:	f022                	sd	s0,32(sp)
 4fe:	ec26                	sd	s1,24(sp)
 500:	e84a                	sd	s2,16(sp)
 502:	1800                	addi	s0,sp,48
 504:	892a                	mv	s2,a0
 506:	84ae                	mv	s1,a1

    int left_pid, right_pid;
    int pipe_fd[2];
    if (pipe(pipe_fd) == -1) {
 508:	fd840513          	addi	a0,s0,-40
 50c:	00000097          	auipc	ra,0x0
 510:	596080e7          	jalr	1430(ra) # aa2 <pipe>
 514:	57fd                	li	a5,-1
 516:	06f50463          	beq	a0,a5,57e <execute_pipe+0x86>
        printf("pipe");
        exit(1);
    }
    left_pid = fork();
 51a:	00000097          	auipc	ra,0x0
 51e:	570080e7          	jalr	1392(ra) # a8a <fork>
    if (left_pid < 0) {
 522:	06054b63          	bltz	a0,598 <execute_pipe+0xa0>
        printf("fork");
        exit(1);
    } else if (left_pid == 0) {
 526:	c551                	beqz	a0,5b2 <execute_pipe+0xba>
        dup(pipe_fd[1]); // Redirect to the write end of the pipe
        close(pipe_fd[1]); // Close the write end of the pipe
        exec(left_cmd[0], left_cmd);
        exit(0);
    }
    close(pipe_fd[1]); // Close the write end of the pipe in the parent process
 528:	fdc42503          	lw	a0,-36(s0)
 52c:	00000097          	auipc	ra,0x0
 530:	58e080e7          	jalr	1422(ra) # aba <close>
    right_pid = fork();
 534:	00000097          	auipc	ra,0x0
 538:	556080e7          	jalr	1366(ra) # a8a <fork>
    if (right_pid < 0) {
 53c:	0a054e63          	bltz	a0,5f8 <execute_pipe+0x100>
        printf("fork");
        exit(1);
    } else if (right_pid == 0) {
 540:	c969                	beqz	a0,612 <execute_pipe+0x11a>
        close(pipe_fd[0]); // Close the read end of the pipe
        exec(right_cmd[0], right_cmd);
        exit(0);
    }
    // Parent process
    close(pipe_fd[0]); // Close the read end of the pipe
 542:	fd842503          	lw	a0,-40(s0)
 546:	00000097          	auipc	ra,0x0
 54a:	574080e7          	jalr	1396(ra) # aba <close>
    close(pipe_fd[1]); // Close the write end of the pipe
 54e:	fdc42503          	lw	a0,-36(s0)
 552:	00000097          	auipc	ra,0x0
 556:	568080e7          	jalr	1384(ra) # aba <close>
    // Wait for both child processes to finish
    int status;
    wait(&status);
 55a:	fd440513          	addi	a0,s0,-44
 55e:	00000097          	auipc	ra,0x0
 562:	53c080e7          	jalr	1340(ra) # a9a <wait>
    wait(&status);
 566:	fd440513          	addi	a0,s0,-44
 56a:	00000097          	auipc	ra,0x0
 56e:	530080e7          	jalr	1328(ra) # a9a <wait>
}
 572:	70a2                	ld	ra,40(sp)
 574:	7402                	ld	s0,32(sp)
 576:	64e2                	ld	s1,24(sp)
 578:	6942                	ld	s2,16(sp)
 57a:	6145                	addi	sp,sp,48
 57c:	8082                	ret
        printf("pipe");
 57e:	00001517          	auipc	a0,0x1
 582:	b1a50513          	addi	a0,a0,-1254 # 1098 <malloc+0x1d4>
 586:	00001097          	auipc	ra,0x1
 58a:	886080e7          	jalr	-1914(ra) # e0c <printf>
        exit(1);
 58e:	4505                	li	a0,1
 590:	00000097          	auipc	ra,0x0
 594:	502080e7          	jalr	1282(ra) # a92 <exit>
        printf("fork");
 598:	00001517          	auipc	a0,0x1
 59c:	b0850513          	addi	a0,a0,-1272 # 10a0 <malloc+0x1dc>
 5a0:	00001097          	auipc	ra,0x1
 5a4:	86c080e7          	jalr	-1940(ra) # e0c <printf>
        exit(1);
 5a8:	4505                	li	a0,1
 5aa:	00000097          	auipc	ra,0x0
 5ae:	4e8080e7          	jalr	1256(ra) # a92 <exit>
        close(pipe_fd[0]); // Close the read end of the pipe
 5b2:	fd842503          	lw	a0,-40(s0)
 5b6:	00000097          	auipc	ra,0x0
 5ba:	504080e7          	jalr	1284(ra) # aba <close>
        close(1); // Close standard output
 5be:	4505                	li	a0,1
 5c0:	00000097          	auipc	ra,0x0
 5c4:	4fa080e7          	jalr	1274(ra) # aba <close>
        dup(pipe_fd[1]); // Redirect to the write end of the pipe
 5c8:	fdc42503          	lw	a0,-36(s0)
 5cc:	00000097          	auipc	ra,0x0
 5d0:	53e080e7          	jalr	1342(ra) # b0a <dup>
        close(pipe_fd[1]); // Close the write end of the pipe
 5d4:	fdc42503          	lw	a0,-36(s0)
 5d8:	00000097          	auipc	ra,0x0
 5dc:	4e2080e7          	jalr	1250(ra) # aba <close>
        exec(left_cmd[0], left_cmd);
 5e0:	85ca                	mv	a1,s2
 5e2:	00093503          	ld	a0,0(s2)
 5e6:	00000097          	auipc	ra,0x0
 5ea:	4e4080e7          	jalr	1252(ra) # aca <exec>
        exit(0);
 5ee:	4501                	li	a0,0
 5f0:	00000097          	auipc	ra,0x0
 5f4:	4a2080e7          	jalr	1186(ra) # a92 <exit>
        printf("fork");
 5f8:	00001517          	auipc	a0,0x1
 5fc:	aa850513          	addi	a0,a0,-1368 # 10a0 <malloc+0x1dc>
 600:	00001097          	auipc	ra,0x1
 604:	80c080e7          	jalr	-2036(ra) # e0c <printf>
        exit(1);
 608:	4505                	li	a0,1
 60a:	00000097          	auipc	ra,0x0
 60e:	488080e7          	jalr	1160(ra) # a92 <exit>
        close(pipe_fd[1]); // Close the write end of the pipe
 612:	fdc42503          	lw	a0,-36(s0)
 616:	00000097          	auipc	ra,0x0
 61a:	4a4080e7          	jalr	1188(ra) # aba <close>
        close(0); // Close standard input
 61e:	4501                	li	a0,0
 620:	00000097          	auipc	ra,0x0
 624:	49a080e7          	jalr	1178(ra) # aba <close>
        dup(pipe_fd[0]); // Redirect from the read end of the pipe
 628:	fd842503          	lw	a0,-40(s0)
 62c:	00000097          	auipc	ra,0x0
 630:	4de080e7          	jalr	1246(ra) # b0a <dup>
        close(pipe_fd[0]); // Close the read end of the pipe
 634:	fd842503          	lw	a0,-40(s0)
 638:	00000097          	auipc	ra,0x0
 63c:	482080e7          	jalr	1154(ra) # aba <close>
        exec(right_cmd[0], right_cmd);
 640:	85a6                	mv	a1,s1
 642:	6088                	ld	a0,0(s1)
 644:	00000097          	auipc	ra,0x0
 648:	486080e7          	jalr	1158(ra) # aca <exec>
        exit(0);
 64c:	4501                	li	a0,0
 64e:	00000097          	auipc	ra,0x0
 652:	444080e7          	jalr	1092(ra) # a92 <exit>

0000000000000656 <main>:

int main() {
 656:	cb010113          	addi	sp,sp,-848
 65a:	34113423          	sd	ra,840(sp)
 65e:	34813023          	sd	s0,832(sp)
 662:	32913c23          	sd	s1,824(sp)
 666:	33213823          	sd	s2,816(sp)
 66a:	33313423          	sd	s3,808(sp)
 66e:	33413023          	sd	s4,800(sp)
 672:	31513c23          	sd	s5,792(sp)
 676:	31613823          	sd	s6,784(sp)
 67a:	31713423          	sd	s7,776(sp)
 67e:	0e80                	addi	s0,sp,848
    char line[512];
    while (1) {
        printf(">>> ");
 680:	00001917          	auipc	s2,0x1
 684:	a2890913          	addi	s2,s2,-1496 # 10a8 <malloc+0x1e4>
            // The input command does not contain a pipe '|'
            char *args[MAX_ARGS];
            int num_args = 0;
            parse_args(line, args, &num_args);
            if (num_args > 0) {
                if (strcmp(args[0], "cd") == 0) {
 688:	00001a17          	auipc	s4,0x1
 68c:	a28a0a13          	addi	s4,s4,-1496 # 10b0 <malloc+0x1ec>
                    if (num_args != 2) {
                        printf("Usage: cd <directory>\n");
                    } else if (chdir(args[1]) < 0) {
                        printf("Error: cannot change directory to %s\n", args[1]);
                    }
                } else if (strcmp(args[0], "q") == 0) {
 690:	00001b17          	auipc	s6,0x1
 694:	a68b0b13          	addi	s6,s6,-1432 # 10f8 <malloc+0x234>
                pipe_found = 1;
 698:	4485                	li	s1,1
 69a:	a0f5                	j	786 <main+0x130>
        for (int i = 0; line[i] != '\0'; i++) {
 69c:	0705                	addi	a4,a4,1
 69e:	fff74783          	lbu	a5,-1(a4)
 6a2:	c789                	beqz	a5,6ac <main+0x56>
            if (line[i] == '|') {
 6a4:	fec79ce3          	bne	a5,a2,69c <main+0x46>
                pipe_found = 1;
 6a8:	85a6                	mv	a1,s1
 6aa:	bfcd                	j	69c <main+0x46>
        if (pipe_found) {
 6ac:	e5b1                	bnez	a1,6f8 <main+0xa2>
            int num_args = 0;
 6ae:	ca042823          	sw	zero,-848(s0)
            parse_args(line, args, &num_args);
 6b2:	cb040613          	addi	a2,s0,-848
 6b6:	d3040593          	addi	a1,s0,-720
 6ba:	db040513          	addi	a0,s0,-592
 6be:	00000097          	auipc	ra,0x0
 6c2:	942080e7          	jalr	-1726(ra) # 0 <parse_args>
            if (num_args > 0) {
 6c6:	cb042b83          	lw	s7,-848(s0)
 6ca:	0b705e63          	blez	s7,786 <main+0x130>
                if (strcmp(args[0], "cd") == 0) {
 6ce:	85d2                	mv	a1,s4
 6d0:	d3043503          	ld	a0,-720(s0)
 6d4:	00000097          	auipc	ra,0x0
 6d8:	16e080e7          	jalr	366(ra) # 842 <strcmp>
 6dc:	10051363          	bnez	a0,7e2 <main+0x18c>
                    if (num_args != 2) {
 6e0:	4789                	li	a5,2
 6e2:	0cfb8d63          	beq	s7,a5,7bc <main+0x166>
                        printf("Usage: cd <directory>\n");
 6e6:	00001517          	auipc	a0,0x1
 6ea:	9d250513          	addi	a0,a0,-1582 # 10b8 <malloc+0x1f4>
 6ee:	00000097          	auipc	ra,0x0
 6f2:	71e080e7          	jalr	1822(ra) # e0c <printf>
 6f6:	a841                	j	786 <main+0x130>
 6f8:	4301                	li	t1,0
 6fa:	4e01                	li	t3,0
            char *end = line;
 6fc:	db040793          	addi	a5,s0,-592
            char *start = line;
 700:	863e                	mv	a2,a5
            int right_args = 0;
 702:	4501                	li	a0,0
            int left_args = 0;
 704:	4701                	li	a4,0
                if (*end == '|') {
 706:	07c00813          	li	a6,124
                        *end = '\0';
 70a:	88ae                	mv	a7,a1
 70c:	a829                	j	726 <main+0xd0>
 70e:	8326                	mv	t1,s1
 710:	00078023          	sb	zero,0(a5)
 714:	89b2                	mv	s3,a2
                        start = end + 1;
 716:	00178613          	addi	a2,a5,1
                        *end = '\0';
 71a:	853a                	mv	a0,a4
 71c:	8746                	mv	a4,a7
                end++;
 71e:	0785                	addi	a5,a5,1
            while (*end != '\0') {
 720:	0007c683          	lbu	a3,0(a5)
 724:	ce89                	beqz	a3,73e <main+0xe8>
                if (*end == '|') {
 726:	ff069ce3          	bne	a3,a6,71e <main+0xc8>
                    if (start != end) {
 72a:	00f60863          	beq	a2,a5,73a <main+0xe4>
                        if (left_args == 0) {
 72e:	f365                	bnez	a4,70e <main+0xb8>
                            left_cmd[0] = start;
 730:	8ab2                	mv	s5,a2
                        if (left_args == 0) {
 732:	864e                	mv	a2,s3
 734:	872a                	mv	a4,a0
 736:	8e26                	mv	t3,s1
 738:	bfe1                	j	710 <main+0xba>
 73a:	863e                	mv	a2,a5
 73c:	b7cd                	j	71e <main+0xc8>
 73e:	00030463          	beqz	t1,746 <main+0xf0>
 742:	d3343823          	sd	s3,-720(s0)
 746:	000e0463          	beqz	t3,74e <main+0xf8>
 74a:	cb543823          	sd	s5,-848(s0)
            if (start != end) {
 74e:	00f60663          	beq	a2,a5,75a <main+0x104>
                if (left_args == 0) {
 752:	e32d                	bnez	a4,7b4 <main+0x15e>
                    left_cmd[0] = start;
 754:	cac43823          	sd	a2,-848(s0)
                    left_args = 1;
 758:	872e                	mv	a4,a1
            left_cmd[left_args] = 0;
 75a:	070e                	slli	a4,a4,0x3
 75c:	fb070793          	addi	a5,a4,-80
 760:	00878733          	add	a4,a5,s0
 764:	d0073023          	sd	zero,-768(a4)
            right_cmd[right_args] = 0;
 768:	050e                	slli	a0,a0,0x3
 76a:	fb050793          	addi	a5,a0,-80
 76e:	00878533          	add	a0,a5,s0
 772:	d8053023          	sd	zero,-640(a0)
            execute_pipe(left_cmd, right_cmd);
 776:	d3040593          	addi	a1,s0,-720
 77a:	cb040513          	addi	a0,s0,-848
 77e:	00000097          	auipc	ra,0x0
 782:	d7a080e7          	jalr	-646(ra) # 4f8 <execute_pipe>
        printf(">>> ");
 786:	854a                	mv	a0,s2
 788:	00000097          	auipc	ra,0x0
 78c:	684080e7          	jalr	1668(ra) # e0c <printf>
        gets(line, sizeof(line));
 790:	20000593          	li	a1,512
 794:	db040513          	addi	a0,s0,-592
 798:	00000097          	auipc	ra,0x0
 79c:	146080e7          	jalr	326(ra) # 8de <gets>
        for (int i = 0; line[i] != '\0'; i++) {
 7a0:	db044683          	lbu	a3,-592(s0)
 7a4:	d689                	beqz	a3,6ae <main+0x58>
 7a6:	db140713          	addi	a4,s0,-591
 7aa:	87b6                	mv	a5,a3
        int pipe_found = 0;
 7ac:	4581                	li	a1,0
            if (line[i] == '|') {
 7ae:	07c00613          	li	a2,124
 7b2:	bdcd                	j	6a4 <main+0x4e>
                    right_cmd[0] = start;
 7b4:	d2c43823          	sd	a2,-720(s0)
                    right_args = 1;
 7b8:	853a                	mv	a0,a4
 7ba:	b745                	j	75a <main+0x104>
                    } else if (chdir(args[1]) < 0) {
 7bc:	d3843503          	ld	a0,-712(s0)
 7c0:	00000097          	auipc	ra,0x0
 7c4:	342080e7          	jalr	834(ra) # b02 <chdir>
 7c8:	fa055fe3          	bgez	a0,786 <main+0x130>
                        printf("Error: cannot change directory to %s\n", args[1]);
 7cc:	d3843583          	ld	a1,-712(s0)
 7d0:	00001517          	auipc	a0,0x1
 7d4:	90050513          	addi	a0,a0,-1792 # 10d0 <malloc+0x20c>
 7d8:	00000097          	auipc	ra,0x0
 7dc:	634080e7          	jalr	1588(ra) # e0c <printf>
 7e0:	b75d                	j	786 <main+0x130>
                } else if (strcmp(args[0], "q") == 0) {
 7e2:	85da                	mv	a1,s6
 7e4:	d3043503          	ld	a0,-720(s0)
 7e8:	00000097          	auipc	ra,0x0
 7ec:	05a080e7          	jalr	90(ra) # 842 <strcmp>
 7f0:	c911                	beqz	a0,804 <main+0x1ae>
                    exit(0);
                } else {
                    execute_command(args[0], args);
 7f2:	d3040593          	addi	a1,s0,-720
 7f6:	d3043503          	ld	a0,-720(s0)
 7fa:	00000097          	auipc	ra,0x0
 7fe:	8d6080e7          	jalr	-1834(ra) # d0 <execute_command>
 802:	b751                	j	786 <main+0x130>
                    exit(0);
 804:	00000097          	auipc	ra,0x0
 808:	28e080e7          	jalr	654(ra) # a92 <exit>

000000000000080c <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 80c:	1141                	addi	sp,sp,-16
 80e:	e406                	sd	ra,8(sp)
 810:	e022                	sd	s0,0(sp)
 812:	0800                	addi	s0,sp,16
  extern int main();
  main();
 814:	00000097          	auipc	ra,0x0
 818:	e42080e7          	jalr	-446(ra) # 656 <main>
  exit(0);
 81c:	4501                	li	a0,0
 81e:	00000097          	auipc	ra,0x0
 822:	274080e7          	jalr	628(ra) # a92 <exit>

0000000000000826 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 826:	1141                	addi	sp,sp,-16
 828:	e422                	sd	s0,8(sp)
 82a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 82c:	87aa                	mv	a5,a0
 82e:	0585                	addi	a1,a1,1
 830:	0785                	addi	a5,a5,1
 832:	fff5c703          	lbu	a4,-1(a1)
 836:	fee78fa3          	sb	a4,-1(a5)
 83a:	fb75                	bnez	a4,82e <strcpy+0x8>
    ;
  return os;
}
 83c:	6422                	ld	s0,8(sp)
 83e:	0141                	addi	sp,sp,16
 840:	8082                	ret

0000000000000842 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 842:	1141                	addi	sp,sp,-16
 844:	e422                	sd	s0,8(sp)
 846:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 848:	00054783          	lbu	a5,0(a0)
 84c:	cb91                	beqz	a5,860 <strcmp+0x1e>
 84e:	0005c703          	lbu	a4,0(a1)
 852:	00f71763          	bne	a4,a5,860 <strcmp+0x1e>
    p++, q++;
 856:	0505                	addi	a0,a0,1
 858:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 85a:	00054783          	lbu	a5,0(a0)
 85e:	fbe5                	bnez	a5,84e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 860:	0005c503          	lbu	a0,0(a1)
}
 864:	40a7853b          	subw	a0,a5,a0
 868:	6422                	ld	s0,8(sp)
 86a:	0141                	addi	sp,sp,16
 86c:	8082                	ret

000000000000086e <strlen>:

uint
strlen(const char *s)
{
 86e:	1141                	addi	sp,sp,-16
 870:	e422                	sd	s0,8(sp)
 872:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 874:	00054783          	lbu	a5,0(a0)
 878:	cf91                	beqz	a5,894 <strlen+0x26>
 87a:	0505                	addi	a0,a0,1
 87c:	87aa                	mv	a5,a0
 87e:	4685                	li	a3,1
 880:	9e89                	subw	a3,a3,a0
 882:	00f6853b          	addw	a0,a3,a5
 886:	0785                	addi	a5,a5,1
 888:	fff7c703          	lbu	a4,-1(a5)
 88c:	fb7d                	bnez	a4,882 <strlen+0x14>
    ;
  return n;
}
 88e:	6422                	ld	s0,8(sp)
 890:	0141                	addi	sp,sp,16
 892:	8082                	ret
  for(n = 0; s[n]; n++)
 894:	4501                	li	a0,0
 896:	bfe5                	j	88e <strlen+0x20>

0000000000000898 <memset>:

void*
memset(void *dst, int c, uint n)
{
 898:	1141                	addi	sp,sp,-16
 89a:	e422                	sd	s0,8(sp)
 89c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 89e:	ca19                	beqz	a2,8b4 <memset+0x1c>
 8a0:	87aa                	mv	a5,a0
 8a2:	1602                	slli	a2,a2,0x20
 8a4:	9201                	srli	a2,a2,0x20
 8a6:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 8aa:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 8ae:	0785                	addi	a5,a5,1
 8b0:	fee79de3          	bne	a5,a4,8aa <memset+0x12>
  }
  return dst;
}
 8b4:	6422                	ld	s0,8(sp)
 8b6:	0141                	addi	sp,sp,16
 8b8:	8082                	ret

00000000000008ba <strchr>:

char*
strchr(const char *s, char c)
{
 8ba:	1141                	addi	sp,sp,-16
 8bc:	e422                	sd	s0,8(sp)
 8be:	0800                	addi	s0,sp,16
  for(; *s; s++)
 8c0:	00054783          	lbu	a5,0(a0)
 8c4:	cb99                	beqz	a5,8da <strchr+0x20>
    if(*s == c)
 8c6:	00f58763          	beq	a1,a5,8d4 <strchr+0x1a>
  for(; *s; s++)
 8ca:	0505                	addi	a0,a0,1
 8cc:	00054783          	lbu	a5,0(a0)
 8d0:	fbfd                	bnez	a5,8c6 <strchr+0xc>
      return (char*)s;
  return 0;
 8d2:	4501                	li	a0,0
}
 8d4:	6422                	ld	s0,8(sp)
 8d6:	0141                	addi	sp,sp,16
 8d8:	8082                	ret
  return 0;
 8da:	4501                	li	a0,0
 8dc:	bfe5                	j	8d4 <strchr+0x1a>

00000000000008de <gets>:

char*
gets(char *buf, int max)
{
 8de:	711d                	addi	sp,sp,-96
 8e0:	ec86                	sd	ra,88(sp)
 8e2:	e8a2                	sd	s0,80(sp)
 8e4:	e4a6                	sd	s1,72(sp)
 8e6:	e0ca                	sd	s2,64(sp)
 8e8:	fc4e                	sd	s3,56(sp)
 8ea:	f852                	sd	s4,48(sp)
 8ec:	f456                	sd	s5,40(sp)
 8ee:	f05a                	sd	s6,32(sp)
 8f0:	ec5e                	sd	s7,24(sp)
 8f2:	1080                	addi	s0,sp,96
 8f4:	8baa                	mv	s7,a0
 8f6:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 8f8:	892a                	mv	s2,a0
 8fa:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 8fc:	4aa9                	li	s5,10
 8fe:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 900:	89a6                	mv	s3,s1
 902:	2485                	addiw	s1,s1,1
 904:	0344d863          	bge	s1,s4,934 <gets+0x56>
    cc = read(0, &c, 1);
 908:	4605                	li	a2,1
 90a:	faf40593          	addi	a1,s0,-81
 90e:	4501                	li	a0,0
 910:	00000097          	auipc	ra,0x0
 914:	19a080e7          	jalr	410(ra) # aaa <read>
    if(cc < 1)
 918:	00a05e63          	blez	a0,934 <gets+0x56>
    buf[i++] = c;
 91c:	faf44783          	lbu	a5,-81(s0)
 920:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 924:	01578763          	beq	a5,s5,932 <gets+0x54>
 928:	0905                	addi	s2,s2,1
 92a:	fd679be3          	bne	a5,s6,900 <gets+0x22>
  for(i=0; i+1 < max; ){
 92e:	89a6                	mv	s3,s1
 930:	a011                	j	934 <gets+0x56>
 932:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 934:	99de                	add	s3,s3,s7
 936:	00098023          	sb	zero,0(s3)
  return buf;
}
 93a:	855e                	mv	a0,s7
 93c:	60e6                	ld	ra,88(sp)
 93e:	6446                	ld	s0,80(sp)
 940:	64a6                	ld	s1,72(sp)
 942:	6906                	ld	s2,64(sp)
 944:	79e2                	ld	s3,56(sp)
 946:	7a42                	ld	s4,48(sp)
 948:	7aa2                	ld	s5,40(sp)
 94a:	7b02                	ld	s6,32(sp)
 94c:	6be2                	ld	s7,24(sp)
 94e:	6125                	addi	sp,sp,96
 950:	8082                	ret

0000000000000952 <stat>:

int
stat(const char *n, struct stat *st)
{
 952:	1101                	addi	sp,sp,-32
 954:	ec06                	sd	ra,24(sp)
 956:	e822                	sd	s0,16(sp)
 958:	e426                	sd	s1,8(sp)
 95a:	e04a                	sd	s2,0(sp)
 95c:	1000                	addi	s0,sp,32
 95e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 960:	4581                	li	a1,0
 962:	00000097          	auipc	ra,0x0
 966:	170080e7          	jalr	368(ra) # ad2 <open>
  if(fd < 0)
 96a:	02054563          	bltz	a0,994 <stat+0x42>
 96e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 970:	85ca                	mv	a1,s2
 972:	00000097          	auipc	ra,0x0
 976:	178080e7          	jalr	376(ra) # aea <fstat>
 97a:	892a                	mv	s2,a0
  close(fd);
 97c:	8526                	mv	a0,s1
 97e:	00000097          	auipc	ra,0x0
 982:	13c080e7          	jalr	316(ra) # aba <close>
  return r;
}
 986:	854a                	mv	a0,s2
 988:	60e2                	ld	ra,24(sp)
 98a:	6442                	ld	s0,16(sp)
 98c:	64a2                	ld	s1,8(sp)
 98e:	6902                	ld	s2,0(sp)
 990:	6105                	addi	sp,sp,32
 992:	8082                	ret
    return -1;
 994:	597d                	li	s2,-1
 996:	bfc5                	j	986 <stat+0x34>

0000000000000998 <atoi>:

int
atoi(const char *s)
{
 998:	1141                	addi	sp,sp,-16
 99a:	e422                	sd	s0,8(sp)
 99c:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 99e:	00054683          	lbu	a3,0(a0)
 9a2:	fd06879b          	addiw	a5,a3,-48
 9a6:	0ff7f793          	zext.b	a5,a5
 9aa:	4625                	li	a2,9
 9ac:	02f66863          	bltu	a2,a5,9dc <atoi+0x44>
 9b0:	872a                	mv	a4,a0
  n = 0;
 9b2:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 9b4:	0705                	addi	a4,a4,1
 9b6:	0025179b          	slliw	a5,a0,0x2
 9ba:	9fa9                	addw	a5,a5,a0
 9bc:	0017979b          	slliw	a5,a5,0x1
 9c0:	9fb5                	addw	a5,a5,a3
 9c2:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 9c6:	00074683          	lbu	a3,0(a4)
 9ca:	fd06879b          	addiw	a5,a3,-48
 9ce:	0ff7f793          	zext.b	a5,a5
 9d2:	fef671e3          	bgeu	a2,a5,9b4 <atoi+0x1c>
  return n;
}
 9d6:	6422                	ld	s0,8(sp)
 9d8:	0141                	addi	sp,sp,16
 9da:	8082                	ret
  n = 0;
 9dc:	4501                	li	a0,0
 9de:	bfe5                	j	9d6 <atoi+0x3e>

00000000000009e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 9e0:	1141                	addi	sp,sp,-16
 9e2:	e422                	sd	s0,8(sp)
 9e4:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 9e6:	02b57463          	bgeu	a0,a1,a0e <memmove+0x2e>
    while(n-- > 0)
 9ea:	00c05f63          	blez	a2,a08 <memmove+0x28>
 9ee:	1602                	slli	a2,a2,0x20
 9f0:	9201                	srli	a2,a2,0x20
 9f2:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 9f6:	872a                	mv	a4,a0
      *dst++ = *src++;
 9f8:	0585                	addi	a1,a1,1
 9fa:	0705                	addi	a4,a4,1
 9fc:	fff5c683          	lbu	a3,-1(a1)
 a00:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 a04:	fee79ae3          	bne	a5,a4,9f8 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 a08:	6422                	ld	s0,8(sp)
 a0a:	0141                	addi	sp,sp,16
 a0c:	8082                	ret
    dst += n;
 a0e:	00c50733          	add	a4,a0,a2
    src += n;
 a12:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 a14:	fec05ae3          	blez	a2,a08 <memmove+0x28>
 a18:	fff6079b          	addiw	a5,a2,-1
 a1c:	1782                	slli	a5,a5,0x20
 a1e:	9381                	srli	a5,a5,0x20
 a20:	fff7c793          	not	a5,a5
 a24:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 a26:	15fd                	addi	a1,a1,-1
 a28:	177d                	addi	a4,a4,-1
 a2a:	0005c683          	lbu	a3,0(a1)
 a2e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 a32:	fee79ae3          	bne	a5,a4,a26 <memmove+0x46>
 a36:	bfc9                	j	a08 <memmove+0x28>

0000000000000a38 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 a38:	1141                	addi	sp,sp,-16
 a3a:	e422                	sd	s0,8(sp)
 a3c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 a3e:	ca05                	beqz	a2,a6e <memcmp+0x36>
 a40:	fff6069b          	addiw	a3,a2,-1
 a44:	1682                	slli	a3,a3,0x20
 a46:	9281                	srli	a3,a3,0x20
 a48:	0685                	addi	a3,a3,1
 a4a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 a4c:	00054783          	lbu	a5,0(a0)
 a50:	0005c703          	lbu	a4,0(a1)
 a54:	00e79863          	bne	a5,a4,a64 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 a58:	0505                	addi	a0,a0,1
    p2++;
 a5a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 a5c:	fed518e3          	bne	a0,a3,a4c <memcmp+0x14>
  }
  return 0;
 a60:	4501                	li	a0,0
 a62:	a019                	j	a68 <memcmp+0x30>
      return *p1 - *p2;
 a64:	40e7853b          	subw	a0,a5,a4
}
 a68:	6422                	ld	s0,8(sp)
 a6a:	0141                	addi	sp,sp,16
 a6c:	8082                	ret
  return 0;
 a6e:	4501                	li	a0,0
 a70:	bfe5                	j	a68 <memcmp+0x30>

0000000000000a72 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 a72:	1141                	addi	sp,sp,-16
 a74:	e406                	sd	ra,8(sp)
 a76:	e022                	sd	s0,0(sp)
 a78:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 a7a:	00000097          	auipc	ra,0x0
 a7e:	f66080e7          	jalr	-154(ra) # 9e0 <memmove>
}
 a82:	60a2                	ld	ra,8(sp)
 a84:	6402                	ld	s0,0(sp)
 a86:	0141                	addi	sp,sp,16
 a88:	8082                	ret

0000000000000a8a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 a8a:	4885                	li	a7,1
 ecall
 a8c:	00000073          	ecall
 ret
 a90:	8082                	ret

0000000000000a92 <exit>:
.global exit
exit:
 li a7, SYS_exit
 a92:	4889                	li	a7,2
 ecall
 a94:	00000073          	ecall
 ret
 a98:	8082                	ret

0000000000000a9a <wait>:
.global wait
wait:
 li a7, SYS_wait
 a9a:	488d                	li	a7,3
 ecall
 a9c:	00000073          	ecall
 ret
 aa0:	8082                	ret

0000000000000aa2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 aa2:	4891                	li	a7,4
 ecall
 aa4:	00000073          	ecall
 ret
 aa8:	8082                	ret

0000000000000aaa <read>:
.global read
read:
 li a7, SYS_read
 aaa:	4895                	li	a7,5
 ecall
 aac:	00000073          	ecall
 ret
 ab0:	8082                	ret

0000000000000ab2 <write>:
.global write
write:
 li a7, SYS_write
 ab2:	48c1                	li	a7,16
 ecall
 ab4:	00000073          	ecall
 ret
 ab8:	8082                	ret

0000000000000aba <close>:
.global close
close:
 li a7, SYS_close
 aba:	48d5                	li	a7,21
 ecall
 abc:	00000073          	ecall
 ret
 ac0:	8082                	ret

0000000000000ac2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 ac2:	4899                	li	a7,6
 ecall
 ac4:	00000073          	ecall
 ret
 ac8:	8082                	ret

0000000000000aca <exec>:
.global exec
exec:
 li a7, SYS_exec
 aca:	489d                	li	a7,7
 ecall
 acc:	00000073          	ecall
 ret
 ad0:	8082                	ret

0000000000000ad2 <open>:
.global open
open:
 li a7, SYS_open
 ad2:	48bd                	li	a7,15
 ecall
 ad4:	00000073          	ecall
 ret
 ad8:	8082                	ret

0000000000000ada <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 ada:	48c5                	li	a7,17
 ecall
 adc:	00000073          	ecall
 ret
 ae0:	8082                	ret

0000000000000ae2 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 ae2:	48c9                	li	a7,18
 ecall
 ae4:	00000073          	ecall
 ret
 ae8:	8082                	ret

0000000000000aea <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 aea:	48a1                	li	a7,8
 ecall
 aec:	00000073          	ecall
 ret
 af0:	8082                	ret

0000000000000af2 <link>:
.global link
link:
 li a7, SYS_link
 af2:	48cd                	li	a7,19
 ecall
 af4:	00000073          	ecall
 ret
 af8:	8082                	ret

0000000000000afa <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 afa:	48d1                	li	a7,20
 ecall
 afc:	00000073          	ecall
 ret
 b00:	8082                	ret

0000000000000b02 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 b02:	48a5                	li	a7,9
 ecall
 b04:	00000073          	ecall
 ret
 b08:	8082                	ret

0000000000000b0a <dup>:
.global dup
dup:
 li a7, SYS_dup
 b0a:	48a9                	li	a7,10
 ecall
 b0c:	00000073          	ecall
 ret
 b10:	8082                	ret

0000000000000b12 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 b12:	48ad                	li	a7,11
 ecall
 b14:	00000073          	ecall
 ret
 b18:	8082                	ret

0000000000000b1a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 b1a:	48b1                	li	a7,12
 ecall
 b1c:	00000073          	ecall
 ret
 b20:	8082                	ret

0000000000000b22 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 b22:	48b5                	li	a7,13
 ecall
 b24:	00000073          	ecall
 ret
 b28:	8082                	ret

0000000000000b2a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 b2a:	48b9                	li	a7,14
 ecall
 b2c:	00000073          	ecall
 ret
 b30:	8082                	ret

0000000000000b32 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 b32:	1101                	addi	sp,sp,-32
 b34:	ec06                	sd	ra,24(sp)
 b36:	e822                	sd	s0,16(sp)
 b38:	1000                	addi	s0,sp,32
 b3a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 b3e:	4605                	li	a2,1
 b40:	fef40593          	addi	a1,s0,-17
 b44:	00000097          	auipc	ra,0x0
 b48:	f6e080e7          	jalr	-146(ra) # ab2 <write>
}
 b4c:	60e2                	ld	ra,24(sp)
 b4e:	6442                	ld	s0,16(sp)
 b50:	6105                	addi	sp,sp,32
 b52:	8082                	ret

0000000000000b54 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 b54:	7139                	addi	sp,sp,-64
 b56:	fc06                	sd	ra,56(sp)
 b58:	f822                	sd	s0,48(sp)
 b5a:	f426                	sd	s1,40(sp)
 b5c:	f04a                	sd	s2,32(sp)
 b5e:	ec4e                	sd	s3,24(sp)
 b60:	0080                	addi	s0,sp,64
 b62:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 b64:	c299                	beqz	a3,b6a <printint+0x16>
 b66:	0805c963          	bltz	a1,bf8 <printint+0xa4>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 b6a:	2581                	sext.w	a1,a1
  neg = 0;
 b6c:	4881                	li	a7,0
 b6e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 b72:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 b74:	2601                	sext.w	a2,a2
 b76:	00000517          	auipc	a0,0x0
 b7a:	5ea50513          	addi	a0,a0,1514 # 1160 <digits>
 b7e:	883a                	mv	a6,a4
 b80:	2705                	addiw	a4,a4,1
 b82:	02c5f7bb          	remuw	a5,a1,a2
 b86:	1782                	slli	a5,a5,0x20
 b88:	9381                	srli	a5,a5,0x20
 b8a:	97aa                	add	a5,a5,a0
 b8c:	0007c783          	lbu	a5,0(a5)
 b90:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 b94:	0005879b          	sext.w	a5,a1
 b98:	02c5d5bb          	divuw	a1,a1,a2
 b9c:	0685                	addi	a3,a3,1
 b9e:	fec7f0e3          	bgeu	a5,a2,b7e <printint+0x2a>
  if(neg)
 ba2:	00088c63          	beqz	a7,bba <printint+0x66>
    buf[i++] = '-';
 ba6:	fd070793          	addi	a5,a4,-48
 baa:	00878733          	add	a4,a5,s0
 bae:	02d00793          	li	a5,45
 bb2:	fef70823          	sb	a5,-16(a4)
 bb6:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 bba:	02e05863          	blez	a4,bea <printint+0x96>
 bbe:	fc040793          	addi	a5,s0,-64
 bc2:	00e78933          	add	s2,a5,a4
 bc6:	fff78993          	addi	s3,a5,-1
 bca:	99ba                	add	s3,s3,a4
 bcc:	377d                	addiw	a4,a4,-1
 bce:	1702                	slli	a4,a4,0x20
 bd0:	9301                	srli	a4,a4,0x20
 bd2:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 bd6:	fff94583          	lbu	a1,-1(s2)
 bda:	8526                	mv	a0,s1
 bdc:	00000097          	auipc	ra,0x0
 be0:	f56080e7          	jalr	-170(ra) # b32 <putc>
  while(--i >= 0)
 be4:	197d                	addi	s2,s2,-1
 be6:	ff3918e3          	bne	s2,s3,bd6 <printint+0x82>
}
 bea:	70e2                	ld	ra,56(sp)
 bec:	7442                	ld	s0,48(sp)
 bee:	74a2                	ld	s1,40(sp)
 bf0:	7902                	ld	s2,32(sp)
 bf2:	69e2                	ld	s3,24(sp)
 bf4:	6121                	addi	sp,sp,64
 bf6:	8082                	ret
    x = -xx;
 bf8:	40b005bb          	negw	a1,a1
    neg = 1;
 bfc:	4885                	li	a7,1
    x = -xx;
 bfe:	bf85                	j	b6e <printint+0x1a>

0000000000000c00 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 c00:	7119                	addi	sp,sp,-128
 c02:	fc86                	sd	ra,120(sp)
 c04:	f8a2                	sd	s0,112(sp)
 c06:	f4a6                	sd	s1,104(sp)
 c08:	f0ca                	sd	s2,96(sp)
 c0a:	ecce                	sd	s3,88(sp)
 c0c:	e8d2                	sd	s4,80(sp)
 c0e:	e4d6                	sd	s5,72(sp)
 c10:	e0da                	sd	s6,64(sp)
 c12:	fc5e                	sd	s7,56(sp)
 c14:	f862                	sd	s8,48(sp)
 c16:	f466                	sd	s9,40(sp)
 c18:	f06a                	sd	s10,32(sp)
 c1a:	ec6e                	sd	s11,24(sp)
 c1c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 c1e:	0005c903          	lbu	s2,0(a1)
 c22:	18090f63          	beqz	s2,dc0 <vprintf+0x1c0>
 c26:	8aaa                	mv	s5,a0
 c28:	8b32                	mv	s6,a2
 c2a:	00158493          	addi	s1,a1,1
  state = 0;
 c2e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 c30:	02500a13          	li	s4,37
 c34:	4c55                	li	s8,21
 c36:	00000c97          	auipc	s9,0x0
 c3a:	4d2c8c93          	addi	s9,s9,1234 # 1108 <malloc+0x244>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c3e:	02800d93          	li	s11,40
  putc(fd, 'x');
 c42:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 c44:	00000b97          	auipc	s7,0x0
 c48:	51cb8b93          	addi	s7,s7,1308 # 1160 <digits>
 c4c:	a839                	j	c6a <vprintf+0x6a>
        putc(fd, c);
 c4e:	85ca                	mv	a1,s2
 c50:	8556                	mv	a0,s5
 c52:	00000097          	auipc	ra,0x0
 c56:	ee0080e7          	jalr	-288(ra) # b32 <putc>
 c5a:	a019                	j	c60 <vprintf+0x60>
    } else if(state == '%'){
 c5c:	01498d63          	beq	s3,s4,c76 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 c60:	0485                	addi	s1,s1,1
 c62:	fff4c903          	lbu	s2,-1(s1)
 c66:	14090d63          	beqz	s2,dc0 <vprintf+0x1c0>
    if(state == 0){
 c6a:	fe0999e3          	bnez	s3,c5c <vprintf+0x5c>
      if(c == '%'){
 c6e:	ff4910e3          	bne	s2,s4,c4e <vprintf+0x4e>
        state = '%';
 c72:	89d2                	mv	s3,s4
 c74:	b7f5                	j	c60 <vprintf+0x60>
      if(c == 'd'){
 c76:	11490c63          	beq	s2,s4,d8e <vprintf+0x18e>
 c7a:	f9d9079b          	addiw	a5,s2,-99
 c7e:	0ff7f793          	zext.b	a5,a5
 c82:	10fc6e63          	bltu	s8,a5,d9e <vprintf+0x19e>
 c86:	f9d9079b          	addiw	a5,s2,-99
 c8a:	0ff7f713          	zext.b	a4,a5
 c8e:	10ec6863          	bltu	s8,a4,d9e <vprintf+0x19e>
 c92:	00271793          	slli	a5,a4,0x2
 c96:	97e6                	add	a5,a5,s9
 c98:	439c                	lw	a5,0(a5)
 c9a:	97e6                	add	a5,a5,s9
 c9c:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 c9e:	008b0913          	addi	s2,s6,8
 ca2:	4685                	li	a3,1
 ca4:	4629                	li	a2,10
 ca6:	000b2583          	lw	a1,0(s6)
 caa:	8556                	mv	a0,s5
 cac:	00000097          	auipc	ra,0x0
 cb0:	ea8080e7          	jalr	-344(ra) # b54 <printint>
 cb4:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 cb6:	4981                	li	s3,0
 cb8:	b765                	j	c60 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 cba:	008b0913          	addi	s2,s6,8
 cbe:	4681                	li	a3,0
 cc0:	4629                	li	a2,10
 cc2:	000b2583          	lw	a1,0(s6)
 cc6:	8556                	mv	a0,s5
 cc8:	00000097          	auipc	ra,0x0
 ccc:	e8c080e7          	jalr	-372(ra) # b54 <printint>
 cd0:	8b4a                	mv	s6,s2
      state = 0;
 cd2:	4981                	li	s3,0
 cd4:	b771                	j	c60 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 cd6:	008b0913          	addi	s2,s6,8
 cda:	4681                	li	a3,0
 cdc:	866a                	mv	a2,s10
 cde:	000b2583          	lw	a1,0(s6)
 ce2:	8556                	mv	a0,s5
 ce4:	00000097          	auipc	ra,0x0
 ce8:	e70080e7          	jalr	-400(ra) # b54 <printint>
 cec:	8b4a                	mv	s6,s2
      state = 0;
 cee:	4981                	li	s3,0
 cf0:	bf85                	j	c60 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 cf2:	008b0793          	addi	a5,s6,8
 cf6:	f8f43423          	sd	a5,-120(s0)
 cfa:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 cfe:	03000593          	li	a1,48
 d02:	8556                	mv	a0,s5
 d04:	00000097          	auipc	ra,0x0
 d08:	e2e080e7          	jalr	-466(ra) # b32 <putc>
  putc(fd, 'x');
 d0c:	07800593          	li	a1,120
 d10:	8556                	mv	a0,s5
 d12:	00000097          	auipc	ra,0x0
 d16:	e20080e7          	jalr	-480(ra) # b32 <putc>
 d1a:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 d1c:	03c9d793          	srli	a5,s3,0x3c
 d20:	97de                	add	a5,a5,s7
 d22:	0007c583          	lbu	a1,0(a5)
 d26:	8556                	mv	a0,s5
 d28:	00000097          	auipc	ra,0x0
 d2c:	e0a080e7          	jalr	-502(ra) # b32 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 d30:	0992                	slli	s3,s3,0x4
 d32:	397d                	addiw	s2,s2,-1
 d34:	fe0914e3          	bnez	s2,d1c <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 d38:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 d3c:	4981                	li	s3,0
 d3e:	b70d                	j	c60 <vprintf+0x60>
        s = va_arg(ap, char*);
 d40:	008b0913          	addi	s2,s6,8
 d44:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 d48:	02098163          	beqz	s3,d6a <vprintf+0x16a>
        while(*s != 0){
 d4c:	0009c583          	lbu	a1,0(s3)
 d50:	c5ad                	beqz	a1,dba <vprintf+0x1ba>
          putc(fd, *s);
 d52:	8556                	mv	a0,s5
 d54:	00000097          	auipc	ra,0x0
 d58:	dde080e7          	jalr	-546(ra) # b32 <putc>
          s++;
 d5c:	0985                	addi	s3,s3,1
        while(*s != 0){
 d5e:	0009c583          	lbu	a1,0(s3)
 d62:	f9e5                	bnez	a1,d52 <vprintf+0x152>
        s = va_arg(ap, char*);
 d64:	8b4a                	mv	s6,s2
      state = 0;
 d66:	4981                	li	s3,0
 d68:	bde5                	j	c60 <vprintf+0x60>
          s = "(null)";
 d6a:	00000997          	auipc	s3,0x0
 d6e:	39698993          	addi	s3,s3,918 # 1100 <malloc+0x23c>
        while(*s != 0){
 d72:	85ee                	mv	a1,s11
 d74:	bff9                	j	d52 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 d76:	008b0913          	addi	s2,s6,8
 d7a:	000b4583          	lbu	a1,0(s6)
 d7e:	8556                	mv	a0,s5
 d80:	00000097          	auipc	ra,0x0
 d84:	db2080e7          	jalr	-590(ra) # b32 <putc>
 d88:	8b4a                	mv	s6,s2
      state = 0;
 d8a:	4981                	li	s3,0
 d8c:	bdd1                	j	c60 <vprintf+0x60>
        putc(fd, c);
 d8e:	85d2                	mv	a1,s4
 d90:	8556                	mv	a0,s5
 d92:	00000097          	auipc	ra,0x0
 d96:	da0080e7          	jalr	-608(ra) # b32 <putc>
      state = 0;
 d9a:	4981                	li	s3,0
 d9c:	b5d1                	j	c60 <vprintf+0x60>
        putc(fd, '%');
 d9e:	85d2                	mv	a1,s4
 da0:	8556                	mv	a0,s5
 da2:	00000097          	auipc	ra,0x0
 da6:	d90080e7          	jalr	-624(ra) # b32 <putc>
        putc(fd, c);
 daa:	85ca                	mv	a1,s2
 dac:	8556                	mv	a0,s5
 dae:	00000097          	auipc	ra,0x0
 db2:	d84080e7          	jalr	-636(ra) # b32 <putc>
      state = 0;
 db6:	4981                	li	s3,0
 db8:	b565                	j	c60 <vprintf+0x60>
        s = va_arg(ap, char*);
 dba:	8b4a                	mv	s6,s2
      state = 0;
 dbc:	4981                	li	s3,0
 dbe:	b54d                	j	c60 <vprintf+0x60>
    }
  }
}
 dc0:	70e6                	ld	ra,120(sp)
 dc2:	7446                	ld	s0,112(sp)
 dc4:	74a6                	ld	s1,104(sp)
 dc6:	7906                	ld	s2,96(sp)
 dc8:	69e6                	ld	s3,88(sp)
 dca:	6a46                	ld	s4,80(sp)
 dcc:	6aa6                	ld	s5,72(sp)
 dce:	6b06                	ld	s6,64(sp)
 dd0:	7be2                	ld	s7,56(sp)
 dd2:	7c42                	ld	s8,48(sp)
 dd4:	7ca2                	ld	s9,40(sp)
 dd6:	7d02                	ld	s10,32(sp)
 dd8:	6de2                	ld	s11,24(sp)
 dda:	6109                	addi	sp,sp,128
 ddc:	8082                	ret

0000000000000dde <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 dde:	715d                	addi	sp,sp,-80
 de0:	ec06                	sd	ra,24(sp)
 de2:	e822                	sd	s0,16(sp)
 de4:	1000                	addi	s0,sp,32
 de6:	e010                	sd	a2,0(s0)
 de8:	e414                	sd	a3,8(s0)
 dea:	e818                	sd	a4,16(s0)
 dec:	ec1c                	sd	a5,24(s0)
 dee:	03043023          	sd	a6,32(s0)
 df2:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 df6:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 dfa:	8622                	mv	a2,s0
 dfc:	00000097          	auipc	ra,0x0
 e00:	e04080e7          	jalr	-508(ra) # c00 <vprintf>
}
 e04:	60e2                	ld	ra,24(sp)
 e06:	6442                	ld	s0,16(sp)
 e08:	6161                	addi	sp,sp,80
 e0a:	8082                	ret

0000000000000e0c <printf>:

void
printf(const char *fmt, ...)
{
 e0c:	711d                	addi	sp,sp,-96
 e0e:	ec06                	sd	ra,24(sp)
 e10:	e822                	sd	s0,16(sp)
 e12:	1000                	addi	s0,sp,32
 e14:	e40c                	sd	a1,8(s0)
 e16:	e810                	sd	a2,16(s0)
 e18:	ec14                	sd	a3,24(s0)
 e1a:	f018                	sd	a4,32(s0)
 e1c:	f41c                	sd	a5,40(s0)
 e1e:	03043823          	sd	a6,48(s0)
 e22:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 e26:	00840613          	addi	a2,s0,8
 e2a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 e2e:	85aa                	mv	a1,a0
 e30:	4505                	li	a0,1
 e32:	00000097          	auipc	ra,0x0
 e36:	dce080e7          	jalr	-562(ra) # c00 <vprintf>
}
 e3a:	60e2                	ld	ra,24(sp)
 e3c:	6442                	ld	s0,16(sp)
 e3e:	6125                	addi	sp,sp,96
 e40:	8082                	ret

0000000000000e42 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 e42:	1141                	addi	sp,sp,-16
 e44:	e422                	sd	s0,8(sp)
 e46:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 e48:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e4c:	00001797          	auipc	a5,0x1
 e50:	1b47b783          	ld	a5,436(a5) # 2000 <freep>
 e54:	a02d                	j	e7e <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 e56:	4618                	lw	a4,8(a2)
 e58:	9f2d                	addw	a4,a4,a1
 e5a:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 e5e:	6398                	ld	a4,0(a5)
 e60:	6310                	ld	a2,0(a4)
 e62:	a83d                	j	ea0 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 e64:	ff852703          	lw	a4,-8(a0)
 e68:	9f31                	addw	a4,a4,a2
 e6a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 e6c:	ff053683          	ld	a3,-16(a0)
 e70:	a091                	j	eb4 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e72:	6398                	ld	a4,0(a5)
 e74:	00e7e463          	bltu	a5,a4,e7c <free+0x3a>
 e78:	00e6ea63          	bltu	a3,a4,e8c <free+0x4a>
{
 e7c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e7e:	fed7fae3          	bgeu	a5,a3,e72 <free+0x30>
 e82:	6398                	ld	a4,0(a5)
 e84:	00e6e463          	bltu	a3,a4,e8c <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e88:	fee7eae3          	bltu	a5,a4,e7c <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 e8c:	ff852583          	lw	a1,-8(a0)
 e90:	6390                	ld	a2,0(a5)
 e92:	02059813          	slli	a6,a1,0x20
 e96:	01c85713          	srli	a4,a6,0x1c
 e9a:	9736                	add	a4,a4,a3
 e9c:	fae60de3          	beq	a2,a4,e56 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 ea0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 ea4:	4790                	lw	a2,8(a5)
 ea6:	02061593          	slli	a1,a2,0x20
 eaa:	01c5d713          	srli	a4,a1,0x1c
 eae:	973e                	add	a4,a4,a5
 eb0:	fae68ae3          	beq	a3,a4,e64 <free+0x22>
    p->s.ptr = bp->s.ptr;
 eb4:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 eb6:	00001717          	auipc	a4,0x1
 eba:	14f73523          	sd	a5,330(a4) # 2000 <freep>
}
 ebe:	6422                	ld	s0,8(sp)
 ec0:	0141                	addi	sp,sp,16
 ec2:	8082                	ret

0000000000000ec4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ec4:	7139                	addi	sp,sp,-64
 ec6:	fc06                	sd	ra,56(sp)
 ec8:	f822                	sd	s0,48(sp)
 eca:	f426                	sd	s1,40(sp)
 ecc:	f04a                	sd	s2,32(sp)
 ece:	ec4e                	sd	s3,24(sp)
 ed0:	e852                	sd	s4,16(sp)
 ed2:	e456                	sd	s5,8(sp)
 ed4:	e05a                	sd	s6,0(sp)
 ed6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ed8:	02051493          	slli	s1,a0,0x20
 edc:	9081                	srli	s1,s1,0x20
 ede:	04bd                	addi	s1,s1,15
 ee0:	8091                	srli	s1,s1,0x4
 ee2:	0014899b          	addiw	s3,s1,1
 ee6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 ee8:	00001517          	auipc	a0,0x1
 eec:	11853503          	ld	a0,280(a0) # 2000 <freep>
 ef0:	c515                	beqz	a0,f1c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ef2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 ef4:	4798                	lw	a4,8(a5)
 ef6:	02977f63          	bgeu	a4,s1,f34 <malloc+0x70>
 efa:	8a4e                	mv	s4,s3
 efc:	0009871b          	sext.w	a4,s3
 f00:	6685                	lui	a3,0x1
 f02:	00d77363          	bgeu	a4,a3,f08 <malloc+0x44>
 f06:	6a05                	lui	s4,0x1
 f08:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 f0c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 f10:	00001917          	auipc	s2,0x1
 f14:	0f090913          	addi	s2,s2,240 # 2000 <freep>
  if(p == (char*)-1)
 f18:	5afd                	li	s5,-1
 f1a:	a895                	j	f8e <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 f1c:	00001797          	auipc	a5,0x1
 f20:	0f478793          	addi	a5,a5,244 # 2010 <base>
 f24:	00001717          	auipc	a4,0x1
 f28:	0cf73e23          	sd	a5,220(a4) # 2000 <freep>
 f2c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 f2e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 f32:	b7e1                	j	efa <malloc+0x36>
      if(p->s.size == nunits)
 f34:	02e48c63          	beq	s1,a4,f6c <malloc+0xa8>
        p->s.size -= nunits;
 f38:	4137073b          	subw	a4,a4,s3
 f3c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 f3e:	02071693          	slli	a3,a4,0x20
 f42:	01c6d713          	srli	a4,a3,0x1c
 f46:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 f48:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 f4c:	00001717          	auipc	a4,0x1
 f50:	0aa73a23          	sd	a0,180(a4) # 2000 <freep>
      return (void*)(p + 1);
 f54:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 f58:	70e2                	ld	ra,56(sp)
 f5a:	7442                	ld	s0,48(sp)
 f5c:	74a2                	ld	s1,40(sp)
 f5e:	7902                	ld	s2,32(sp)
 f60:	69e2                	ld	s3,24(sp)
 f62:	6a42                	ld	s4,16(sp)
 f64:	6aa2                	ld	s5,8(sp)
 f66:	6b02                	ld	s6,0(sp)
 f68:	6121                	addi	sp,sp,64
 f6a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 f6c:	6398                	ld	a4,0(a5)
 f6e:	e118                	sd	a4,0(a0)
 f70:	bff1                	j	f4c <malloc+0x88>
  hp->s.size = nu;
 f72:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 f76:	0541                	addi	a0,a0,16
 f78:	00000097          	auipc	ra,0x0
 f7c:	eca080e7          	jalr	-310(ra) # e42 <free>
  return freep;
 f80:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 f84:	d971                	beqz	a0,f58 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f86:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 f88:	4798                	lw	a4,8(a5)
 f8a:	fa9775e3          	bgeu	a4,s1,f34 <malloc+0x70>
    if(p == freep)
 f8e:	00093703          	ld	a4,0(s2)
 f92:	853e                	mv	a0,a5
 f94:	fef719e3          	bne	a4,a5,f86 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 f98:	8552                	mv	a0,s4
 f9a:	00000097          	auipc	ra,0x0
 f9e:	b80080e7          	jalr	-1152(ra) # b1a <sbrk>
  if(p == (char*)-1)
 fa2:	fd5518e3          	bne	a0,s5,f72 <malloc+0xae>
        return 0;
 fa6:	4501                	li	a0,0
 fa8:	bf45                	j	f58 <malloc+0x94>
