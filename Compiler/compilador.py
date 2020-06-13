registros = {   #Diccionario con los 25 registros a utilizar.
                'R00':   '00000',
                'R01':   '00001',
                'R02':   '00010',
                'R03':   '00011',
                'R04':   '00100',
                'R05':   '00101',
                'R06':   '00110',
                'R07':   '00111',
                'R08':   '01000',
                'R09':   '01001',
                'R10':   '01010',
                'R11':   '01011',
                'R12':   '01100',
                'R13':   '01101',
                'R14':   '01110',
                'R15':   '01111',
                'R16':   '10000',
                'R17':   '10001',
                'R18':   '10010',
                'R19':   '10011',
                'R20':   '10100',
                'R21':   '10101',
                'R22':   '10110',
                'R23':   '10111',
                'R24':   '11000',
                'R25':   '11001'
            }
instrucciones =  {#Diccionario con las 8 instrucciones a utilizar.
                'INC': '0000',
                'SLT': '0001',
                'CAR': '0010',
                'COM': '0011',
                'SIQ': '0100',
                'SMQ': '0101',
                'MOV': '0110',
                'CPX': '0111',
                'CON': '1000'
                }

def compilador(expresion):
    condicional = "1111"#Determina si la instrucción tiene algo condicional.
    scc = "0"           #Determina si la instrucción DE ACCESO A MEMORIA es load o store.
    resultadoFinal = "" #Expresión en binario en la que se traducirá la instrucción.
    opCode = ""         #00 si la instrucción es aritmética, 01 si es de acceso a memoria, 10 si es de control de flujo o 11 si es especializada.
    inmediato = "0"     #Determina si la instrucción tiene o no un inmediato.
    expresion = expresion.replace(" ","")   #Elimina los espacios de la instrucción.
    comando = instrucciones[expresion[0:3]] #Los primeros 3 caracteres son la instrucción o comando a utilizar.
    if(comando == "0000"): #Incremento (INC)
        opCode = "00"
        registro = registros[expresion[3:6]]    #Registro a incrementar.
        inmediato = "1"
        resultadoFinal = condicional + opCode + inmediato + comando + scc + registro + registro + 9*"0" + "1" #Construcción de la expresión final. Se añaden la cantidad de 0s apropiada para que la instrucción sea de 32 bits.
    elif(comando == "0001" or comando == "0100" or comando == "0101"): #Saltos (SLT - SIQ - SMQ)
        opCode = "10"
        inmediato = "1" #Salta a la línea de código específica donde se encuentra la etiqueta.
        etiqueta = expresion[3:] #La etiqueta correspondiente al código ensamblador donde saltará.
        if (etiqueta == "_REVISAR_SELECCION_DE_KERNEL"):
            etiqueta = 7*"0" + "101"   #La próxima instrucción a ejecutar se encuentra en la línea 4. Se ocupan 15 bits para este inmediato, por eso el relleno.
        elif (etiqueta == "_KERNEL_BLUR"):
            etiqueta = 6*"0" + "1110"
        elif (etiqueta == "_KERNEL_SHARPENNING"):
            etiqueta = 5*"0" + "11001"
        elif (etiqueta == "_KERNEL_OVERSHARPENNING"):
            etiqueta = 4*"0" + "100100"
        elif (etiqueta == "_CONV"):
            etiqueta = 4*"0" + "110001"
        elif (etiqueta == "_RELLENAR_FILA"):
            etiqueta = 4*"0" + "110101"
        elif (etiqueta == "_REINICIAR_CONTADOR_DE_COLUMNAS"):
            etiqueta = 3*"0" + "110111"
        else:   #Etiqueta de _INICIO.
            etiqueta = 8*"0" + "10"
        if (comando == "0100"):
            condicional = "0000"
        elif (comando == "0101"):
            condicional = "1011"
        else:
            condicional = "1111"
        resultadoFinal = condicional + opCode + inmediato + comando + scc + 10*"0" + etiqueta
        
    elif(comando == "0010"): #CAR
        opCode = "01"
        inmediato = "1"
        scc = "1"
        registro = registros[expresion[3:6]]
        resultadoFinal = condicional + opCode + inmediato + comando + scc + registro + 15*"0"
    elif(comando == "0011"): #COM
        opCode = "00"
        inmediato = "1"
        registro = registros[expresion[3:6]]
        numeroBinario = bin(int(expresion[7:]))[2:]
        resultadoFinal = condicional + opCode + inmediato + comando + scc + registro + 5*"0"+(10 - len(numeroBinario))*"0"+numeroBinario
    elif(comando == "0110"): #MOV
        opCode = "01"
        registro1 = registros[expresion[3:6]]
        if (expresion[7] == 'R'):
            registro2 = registros[expresion[7:10]]
            inmediato = "0"
            resultadoFinal = condicional + opCode + inmediato + comando + scc + registro2 + registro1+10*"0"
        else:
            numeroBinario = bin(int(expresion[7:]))[2:] #Toma el número, lo pasa a binario y le quita el '0b' que se añade al inicio del nuevo número.
            inmediato = "1"
            resultadoFinal = condicional + opCode + inmediato + comando + scc + registro1+(15 - len(numeroBinario))*"0"+numeroBinario
    elif (comando == "0111"): #CPX
        opCode = "11"
        inmediato = "1"
        registro = registros[expresion[3:6]]
        numeroBinario = bin(int(expresion[7:]))[2:] #Toma el número, lo pasa a binario y le quita el '0b' que se añade al inicio del nuevo número.
        resultadoFinal = condicional + opCode + inmediato + comando + scc + registro +(15 - len(numeroBinario))*"0"+numeroBinario
    elif(comando == "1000"): #CON
        opCode = "11"
        resultadoFinal = comando + opCode + 26*"0"

    file = open("resultado.txt","r")
    if (file.readline() == ""): #Si el documento está vacío, no le añade un espacio al inicio.
        file.close()
        file = open("resultado.txt","a")
        file.write(resultadoFinal)  #Se añade la primera instrucción.
    else:
        file.close()
        file = open("resultado.txt","a")
        file.write("\n" + resultadoFinal)   #Si el documento no está vacío se hace un salto de línea y se añade la nueva instrucción.
    file.close()

file = open("ensamblador.txt", "r") #Se toma el código ensamblador y se itera a través de sus líneas para llamar al método de compilación.
for x in file:
    if (x[0] == "_"): #Si se topa con una etiqueta, no se manda al método de compilación.
        continue
    else:
        #print(x)
        compilador(x)
file.close()
