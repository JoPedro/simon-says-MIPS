.data
	# 66 sequence
	.word 'e', 'd', 'a', 'q', 'd', 'q', 'a', 'd', 'e', 'e', 'q', 'a', 'a', 'a', 'a', 'd', 'q', 'a', 'q', 'e', 'd', 'e', 'e', 'e', 'q', 'e', 'q', 'a', 'a', 'q', 'e', 'e', 'e', 'q', 'a', 'e', 'e', 'e', 'a', 'e', 'e', 'e', 'd', 'q', 'q', 'e', 'q', 'q', 'd', 'd', 'q', 'd', 'd', 'd', 'd', 'e', 'q', 'q', 'q', 'q', 'q', 'a', 'q', 'e', 'q', 'q'
.text
main:
	addi $s5, $zero, 0 # state
	addi $s6, $zero, 0 # index outer loop
	j fundo
fundo:
	addi $t1, $zero, 128
	lui $23, 0x1001
	addi $t2, $zero, 128
forlinha:
	beq $t2, $zero, fimlinha
	addi $t2, $t2, -1
forcol: 
	beq $t1, $zero, fimfor
	lui $t0, 0x00bf
	ori $t0, 0xbf00
	ori $t0, 0x00bf
	sw $t0, 0($23)
	addi $23, $23, 4
	addi $t1, $t1, -1
	j forcol
fimfor:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha
fimlinha:
	j score
score:
	addi $t1, $zero, 128
	lui $23, 0x1001
	addi $t2, $zero, 20
forlinha1:
	beq $t2, $zero, fimlinha1
	addi $t2, $t2, -1
forcol1: 
	beq $t1, $zero, fimfor1
	lui $t0, 0x0000
	ori $t0, 0x0000
	ori $t0, 0x0000
	sw $t0, 0($23)
	addi $23, $23, 4
	addi $t1, $t1, -1
	j forcol1
fimfor1:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha1
fimlinha1:
	j colors

# cores
colors:
	addi $t1, $zero, 128
	addi $t2, $zero, 68
	lui $23, 0x1001
	add $a0, $zero, $23
	addi $a1, $zero, 640
	addi $a2, $zero, 4
	addi $a3, $zero, 0
	addi $t4, $zero, 65
	addi $t5, $zero, 35
	jal endxy
forlinha2:
	beq $t2, $zero, fimlinha2
	addi $t2, $t2, -1
forcol2: 
	beq $t1, $zero, fimfor2
blue:
	slt $t7, $t2, $t5
	bne $t7, $zero, red
	slt $t6, $t1, $t4
	bne $t6, $zero, yellow
	# 3b54f7
	lui $t0, 0x003b
	ori $t0, 0x5400
	ori $t0, 0x00f7
	j cont
yellow:
	# ffdb63
	lui $t0, 0x00ff
	ori $t0, 0xdc00
	ori $t0, 0x006b
	j cont
red:
	# f23838
	slt $t6, $t1, $t4
	bne $t6, $zero, green
	lui $t0, 0x00f2
	ori $t0, 0x3800
	ori $t0, 0x0038
	j cont
green:
	# 4eab3e
	lui $t0, 0x004e
	ori $t0, 0xab00
	ori $t0, 0x003e
	j cont
cont:
	sw $t0, 0($2)
	addi $2, $2, 4
	addi $t1, $t1, -1
	j forcol2
fimfor2:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha2
fimlinha2:
	jal wait



# state of game
state:
	beq $s5, 0, playnotes
	beq $s5, 1, input
	beq $s5, 2, fimjogo

# play notes in order
playnotes:
	beq $s6, 66, fimouter
	lui $s4, 0x1001
	addi $s3, $zero, 0
fornotes:
	beq $s3, $s6, fimnotes
	lw $s2, 0($s4)
	beq $s2, 113, bluecheck
	beq $s2, 101, yellowcheck
	beq $s2, 97, redcheck
	beq $s2, 100, greencheck
contnotes:
	addi $s4, $s4, 4
	addi $s3, $s3, 1
	j fornotes
bluecheck:
	j colors1
colors1:
	addi $t1, $zero, 128
	addi $t2, $zero, 68
	lui $23, 0x1001
	add $a0, $zero, $23
	addi $a1, $zero, 640
	addi $a2, $zero, 4
	addi $a3, $zero, 0
	addi $t4, $zero, 65
	addi $t5, $zero, 35
	jal endxy
forlinha3:
	beq $t2, $zero, fimlinha3
	addi $t2, $t2, -1
forcol3: 
	beq $t1, $zero, fimfor3
blue1:
	slt $t7, $t2, $t5
	bne $t7, $zero, red1
	slt $t6, $t1, $t4
	bne $t6, $zero, yellow1
	# 91a0ff
	lui $t0, 0x0091
	ori $t0, 0xa000
	ori $t0, 0x00ff
	j cont1
yellow1:
	# ffdb63
	lui $t0, 0x00ff
	ori $t0, 0xdb00
	ori $t0, 0x0063
	j cont1
red1:
	# f23838
	slt $t6, $t1, $t4
	bne $t6, $zero, green1
	lui $t0, 0x00f2
	ori $t0, 0x3800
	ori $t0, 0x0038
	j cont1
green1:
	# 4eab3e
	lui $t0, 0x004e
	ori $t0, 0xab00
	ori $t0, 0x003e
	j cont1
cont1:
	sw $t0, 0($2)
	addi $2, $2, 4
	addi $t1, $t1, -1
	j forcol3
fimfor3:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha3
fimlinha3:
	addi $a0, $zero, 64
	addi $a1, $zero, 1000
	addi $a2, $zero, 0
	addi $a3, $zero, 64
	addi $v0, $zero, 33
	syscall
	j contnotes
yellowcheck:
	j colors2
colors2:
	addi $t1, $zero, 128
	addi $t2, $zero, 68
	lui $23, 0x1001
	add $a0, $zero, $23
	addi $a1, $zero, 640
	addi $a2, $zero, 4
	addi $a3, $zero, 0
	addi $t4, $zero, 65
	addi $t5, $zero, 35
	jal endxy
forlinha4:
	beq $t2, $zero, fimlinha4
	addi $t2, $t2, -1
forcol4: 
	beq $t1, $zero, fimfor4
blue2:
	slt $t7, $t2, $t5
	bne $t7, $zero, red2
	slt $t6, $t1, $t4
	bne $t6, $zero, yellow2
	# 3b54f7
	lui $t0, 0x003b
	ori $t0, 0x5400
	ori $t0, 0x00f7
	j cont2
yellow2:
	# ffedb3
	lui $t0, 0x00ff
	ori $t0, 0xed00
	ori $t0, 0x00b3
	j cont2
red2:
	# f23838
	slt $t6, $t1, $t4
	bne $t6, $zero, green2
	lui $t0, 0x00f2
	ori $t0, 0x3800
	ori $t0, 0x0038
	j cont2
green2:
	# 4eab3e
	lui $t0, 0x004e
	ori $t0, 0xab00
	ori $t0, 0x003e
	j cont2
cont2:
	sw $t0, 0($2)
	addi $2, $2, 4
	addi $t1, $t1, -1
	j forcol4
fimfor4:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha4
fimlinha4:
	addi $a0, $zero, 66
	addi $a1, $zero, 1000
	addi $a2, $zero, 0
	addi $a3, $zero, 64
	addi $v0, $zero, 33
	syscall
	j contnotes
redcheck:
	j colors3
colors3:
	addi $t1, $zero, 128
	addi $t2, $zero, 68
	lui $23, 0x1001
	add $a0, $zero, $23
	addi $a1, $zero, 640
	addi $a2, $zero, 4
	addi $a3, $zero, 0
	addi $t4, $zero, 65
	addi $t5, $zero, 35
	jal endxy
forlinha5:
	beq $t2, $zero, fimlinha5
	addi $t2, $t2, -1
forcol5: 
	beq $t1, $zero, fimfor5
blue3:
	slt $t7, $t2, $t5
	bne $t7, $zero, red3
	slt $t6, $t1, $t4
	bne $t6, $zero, yellow3
	# 3b54f7
	lui $t0, 0x003b
	ori $t0, 0x5400
	ori $t0, 0x00f7
	j cont3
yellow3:
	# ffdb63
	lui $t0, 0x00ff
	ori $t0, 0xdb00
	ori $t0, 0x0063
	j cont3
red3:
	# f07f7f
	slt $t6, $t1, $t4
	bne $t6, $zero, green3
	lui $t0, 0x00f0
	ori $t0, 0x7f00
	ori $t0, 0x007f
	j cont3
green3:
	# 4eab3e
	lui $t0, 0x004e
	ori $t0, 0xab00
	ori $t0, 0x003e
	j cont3
cont3:
	sw $t0, 0($2)
	addi $2, $2, 4
	addi $t1, $t1, -1
	j forcol5
fimfor5:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha5
fimlinha5:
	addi $a0, $zero, 68
	addi $a1, $zero, 1000
	addi $a2, $zero, 0
	addi $a3, $zero, 64
	addi $v0, $zero, 33
	syscall
	j contnotes
greencheck:
	j colors4
colors4:
	addi $t1, $zero, 128
	addi $t2, $zero, 68
	lui $23, 0x1001
	add $a0, $zero, $23
	addi $a1, $zero, 640
	addi $a2, $zero, 4
	addi $a3, $zero, 0
	addi $t4, $zero, 65
	addi $t5, $zero, 35
	jal endxy
forlinha6:
	beq $t2, $zero, fimlinha6
	addi $t2, $t2, -1
forcol6: 
	beq $t1, $zero, fimfor6
blue4:
	slt $t7, $t2, $t5
	bne $t7, $zero, red4
	slt $t6, $t1, $t4
	bne $t6, $zero, yellow4
	# 3b54f7
	lui $t0, 0x003b
	ori $t0, 0x5400
	ori $t0, 0x00f7
	j cont4
yellow4:
	# ffdb63
	lui $t0, 0x00ff
	ori $t0, 0xdb00
	ori $t0, 0x0063
	j cont4
red4:
	# f23838
	slt $t6, $t1, $t4
	bne $t6, $zero, green4
	lui $t0, 0x00f2
	ori $t0, 0x3800
	ori $t0, 0x0038
	j cont4
green4:
	# 8fc985
	lui $t0, 0x008f
	ori $t0, 0xc900
	ori $t0, 0x0085
	j cont4
cont4:
	sw $t0, 0($2)
	addi $2, $2, 4
	addi $t1, $t1, -1
	j forcol6
fimfor6:
	addi $t1, $zero, 128
	addi $t2, $t2, -1
	j forlinha6
fimlinha6:
	addi $a0, $zero, 70
	addi $a1, $zero, 1000
	addi $a2, $zero, 0
	addi $a3, $zero, 64
	addi $v0, $zero, 33
	syscall
	j contnotes
fimnotes:
	# lui $s4, 0x1001
	addi $s5, $zero, 1
	addi $s6, $s6, 1
	j state
fimouter:
	addi $s5, $zero, 2
	j state

# user input
lacostring:
	lui $t8, 0x1001
	addi $s3, $zero, 0
forstring:
	beq $s3, $s6, fiminput
	lw $s2, 0($t8)
input:
	lui $s1, 0xffff
	lw $s0, 0($s1)
	bne $s0, $zero, sailaco
	j input
sailaco:
	lw $t9, 4($s1)
	bne $t9, $t8, erro
	addi $t8, $t8, 4
	addi $s3, $s3, 1
	j forstring
fiminput:
	addi $s5, $zero, 0
	j state
	
# input errado, reinicia do começo
erro:
	addi $s6, $zero, 0
	addi $s5, $zero, 0
	j state

# encerra jogo
fimjogo:
	addi $v0, $zero, 10
	syscall
	
# delay
wait:
	addi $a0, $zero, 100
	addi $v0, $zero, 32
	syscall
fimwait:
	jr $ra
	
# get endereco	
endxy:
	mul $t3, $a1, $a2
	add $t3, $t3, $a3
	sll $t3, $t3, 2
	add $v0, $t3, $a0
fimxy:
	jr $ra
