opcao = true
dddTel = 0
while opcao == true
    regexTel = r"^(\+55)?[\s]?\(?(\d{2})?\)?[\s-]?(9?\d{4}[\s-]?\d{4})$"
    retornoEstado=""
    DDDs = Dict("Acre"=> [68],
                "Alagoas"=> [82],
                "Amazonas"=> [92, 97],
                "Amapá"=> [96],
                "Bahia"=> [71, 73, 74, 75, 77],
                "Ceará"=> [85, 88],
                "Distrito Federal"=> [61],
                "Espírito Santo"=> [27, 28],
                "Goiás"=> [62, 64],
                "Maranhão"=> [98, 99],
                "Minas Gerais"=> [31, 32, 33, 34, 35, 37, 38],
                "Mato Grosso do Sul"=> [67],
                "Mato Grosso"=> [65, 66],
                "Pará"=> [91, 93, 94],
                "Paraíba"=> [83],
                "Pernambuco"=> [81, 87],
                "Piauí"=> [86, 89],
                "Paraná"=> [41, 42, 43, 44, 45, 46],
                "Rio de Janeiro"=> [21, 22, 24],
                "Rio Grande do Norte"=> [84],
                "Rondônia"=> [69],
                "Roraima"=> [95],
                "Rio Grande do Sul"=> [51, 53, 54, 55],
                "Santa Catarina"=> [47, 48, 49],
                "Sergipe"=> [79],
                "São Paulo"=> [11, 12, 13, 14, 15, 16, 17, 18, 19],
                "Tocantins"=> [63]
                )
    print("Digite o número de telefone:\n")
    numeroTel = readline()
    telValid = (match(regexTel, numeroTel))
    try
        if telValid[2] === nothing
            println("Número do telefone: ", telValid[3], "\n", "DDD não fornecido.\n")
        else
            dddTel = parse(Int32, telValid[2])
            for (cidade, dddDisp) in DDDs
                if dddTel in dddDisp
                    retornoEstado =  cidade
                    break
                end
            end
            if retornoEstado != ""
                println("Número do telefone: ", telValid[3], "\n",
                        "DDD do número: ", dddTel, "\n",
                        "Estado: ", retornoEstado, "\n")
            else
                println("DDD inválido, favor verificar o número digitado.\n")
                
            end
        end
    catch
        println("Isto não é um numero de telefone")
    end
    println("Deseja continuar?\nS = SIM; N = NÃO")
    option = readline()
    if option != "s"
        global opcao = false
    end
end