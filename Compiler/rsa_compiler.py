# register dict
registers = {'A0': '000',
             'A1': '001',
             'A2': '010',
             'A3': '011',
             'A4': '100',
             'A5': '101',
             'A6': '110',
             'A7': '111'}

instructions = {'SET': '000',
                'LDPX': '001',
                'MODEX': '010',
                'STPX': '011',
                'CMPEQ': '100',
                'JEQ': '101',
                'J': '110',
                'ADD': '111'}

sizes = {'IMM': 10,
         'MEM_FILL': 7,
         'R_MOD': 4,
         'R_FILL': 3,
         'J_FILL': 13}


def clean_instr(lst):
    return [i.replace("\n", "").replace(",", "").replace("[", "").replace("]", "") for i in lst]


def get_jump_addr(jumps, tag):
    for j in jumps:
        if j[0] == tag:
            return j[1]
    raise Exception("Tag: " + tag + " not found")


def decode(instr):
    instr_split = clean_instr(instr.split(" "))
    dec_instr = ""
    print(instr_split)
    if instr_split[0] not in instructions:
        raise Exception("Instrucion " + instr_split[0] + " does not exist.")
    else:
        opcode = instructions.get(instr_split[0])
        dec_instr += opcode

        if opcode == instructions['SET'] or opcode == instructions['ADD']:
            dec_instr += registers[instr_split[1]]
            dec_instr += bin(int(instr_split[2])).replace("b", "").zfill(sizes['IMM'])

        elif opcode == instructions['LDPX'] or opcode == instructions['STPX']:
            dec_instr += registers[instr_split[1]]
            dec_instr += registers[instr_split[2]]
            dec_instr += '0'.zfill(sizes["MEM_FILL"])

        elif opcode == instructions['MODEX'] or opcode == instructions['CMPEQ']:
            if len(instr_split) == sizes['R_MOD']:
                dec_instr += registers[instr_split[1]]
                dec_instr += registers[instr_split[2]]
                dec_instr += registers[instr_split[3]]
            else:
                dec_instr += '0'.zfill(sizes['R_FILL'])
                dec_instr += registers[instr_split[1]]
                dec_instr += registers[instr_split[2]]
            dec_instr += '0'.zfill(sizes['R_MOD'])

        elif opcode == instructions['JEQ'] or opcode == instructions['J']:
            dec_instr += bin(get_jump_addr(jump_tags, instr_split[1])).replace("b", "").zfill(sizes['J_FILL'])

    return dec_instr


asm_file = open("program.txt", "r")

compiled_asm = open("memfile.dat", "w")
compiled_asm.close()

jump_tags = []
line_numbr = 0

for line in asm_file:
    if line[0] != '_':
        comp_file = open("memfile.dat", "a")
        comp_file.writelines(decode(line) + "\n")
    else:
        if line_numbr != 0:
            jump_tags.append((line.replace("\n", "").replace(":", ""), line_numbr - 1))
        else:
            jump_tags.append((line.replace("\n", "").replace(":", ""), line_numbr))
    line_numbr += 1

asm_file.close()
