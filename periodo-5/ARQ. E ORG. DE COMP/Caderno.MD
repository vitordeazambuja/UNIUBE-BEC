# Arquitetura e Organização de Computadores

## Memória Virtual / Virtualização:
**Pipeline:** Método usado para executar várias instruções ao mesmo tempo, dividindo uma tarefa em partes menores que podem ser processadas simultaneamente.
- Processamento paralelo
- Melhora o desempenho do sistema

---

**Memória RAM:** Também chamada de *memória principal*, é conectada diretamente ou indiretamente ao processador através de um *barramento de memória*.

**Barramento de memória:** É constituido por um *barramento de endereço* e um *barramento de dados*

---

**Processador e memória:**

O processador envia um *endereço de memória*, que indica a posição dos dados na memória, através do *barramento de endereço*.

Então o processador lê ou escreve os dados do *barramento de dados*.

Também pode haver uma UGM (Unidade de Gerência de Memória, MMU - Memory Management Unit) que é um dispositivo colocado entre o processador e a memória RAM. A Unidade de Gerência de Memória calcula o endereço real da memória quando é usada uma abstração de memória virtual.

---

**Memória Virtual:**

Quando a memória primária (RAM) se enche, o sistema move pedaços menos usados (páginas) para um dispositivo de memória secundária (disco rígido), recuperando mais tarde quando forem necessários.

O desempenho fica degradado porém o sistema não para de funcionar.

O endereçamento de memória virtual permite definir a memória que cada programa pode usar.

---

**Modo protegido e Modo supervisor:** 

Esses modos permitem que algumas funções do processador central sejam controladas e alteradas pelo núcleo.

O computador começa a funcionar automaticamente no modo supervisor.

---

## Funções e Portas Lógicas:

**George Boole** desenvolveu um sistema matemático de análise lógica.

**Claude Elwood Shannon** sugeriu que a álgebra booleana poderia ser usada para análise e projeto de circuitos de comutação.

**Funções:**

*Função E (AND):* Executa a multiplicação (conjunção) booleana.

*Função OU (OR):* Executa a soma (disjunção) booleana.

*Função NÃO (NOT):* Executa o complemento (negação) de uma variável binária.

---

## UCP, UC, RISC E CISC:

**UCP/CPU:** Unidade Central de Processamento - Cérebro do computador

Responsável pelo processamento e execução dos programas armazenados na memória primária.

Executa instruções e controla operações no computador sob comando de um sistema operacional.

---

### Componentes da UCP:
**UAL:** Unidade Aritmética e Lógica - Execução das instruções.

**UC:** Unidade de Controle - Busca, interpretação e controle de execução das instruções.

**Registradores**

**Interconexão interna da CPU**

---

### Registradores Importantes na UCP:

**UCP:**
- CI (Contador de Instruções): Armazena o endereço da próxima instrução a ser executada.

- RI (Registrador de Instrução): Armazena a instrução a ser executada.

**UAL:**
- ACC (Acumulador): Armazena os dados para as operações na UAL.

O tamanho da palavra é igual ao tamanho do acumulador.

---

### OPCODE e OP:

- **OPCODE (Código da Operação):** Identifica a operação a ser realizada pelo processador. É a entrada no decodificador de instruções na unidade de controle. Cada instrução deve ter um código único que a identifique.

- **OP (Operandos):** Identifica o endereço de memória onde está contido o dado que será manipulado. Ou conter o endereço onde o resultado da operação será armazenado. Também pode indicar um Registrador. Os operandos fornecem os dados da instrução.

---

### Conjunto de instruções:
-  O projeto de um processador é centrado no seu conjunto ("set") de instruções.

Funcionalmente, um processador precisa possuir instruções para:
- operações matemáticas
- aritméticas: +, - , × , ÷ ...
- lógicas: and, or, xor, ...
- de complemento
- de deslocamento
- Operações de movimentação de dados (memória <--> UCP, reg <--> reg)
- Operações de entrada e saida (leitura e escrita em dispositivos de E/S)
- Operações de controle (desvio de seqüência de execução, parada) 

---

### CISC E RISC:

- **CISC (Complex Instruction Set Computer):** Um conjunto de instruções maior e mais complexo, implicando num processador mais complexo, com ciclo de processamento mais lento

- **RISC (Reduced Instruction Set Computer):** Um conjunto de instruções menor e mais simples, implicando num processador mais simples, com ciclo de processamento rápido.

---

### Decodificador de Instruções na UC:
- **Wired Logic:** Instruções são todas implementadas em circuito

- **Microcódigo:** Um grupo básico de instruções são implementadas em circuitos; as demais são "montadas" através de microprogramas que usam as instruções básicas.

---

### Ciclo das instruções na UCP:
- As instruções são executadas sequencialmente (a não ser pela ocorrência de um desvio), uma a uma.

- O CI indica a seqüência de execução, isto é, o CI controla o fluxo de execução das instruções.

Descrição do processamento de uma instrução na UCP:
- a UC lê o endereço da próxima instrução no CI;
- a UC transfere o endereço da próxima instrução, através do barramento interno, para o REM;