# Banco de Dados II

## Controle de Concorrência

Qualquer banco de dados que seja utilizado por **mais de um usuário**, terá que administrar o controle de concorrência entre as informações que estão sendo acessadas pelos usuários.

Controle de concorrência é quando, em um banco de dados, usuários distintos tentam acessar a **mesma informação** e então é feito um controle entre essas transações.

![Demonstração de concorrência](./Imagens%20Caderno/concorrencia.png)

## Transação

Segundo Date (2003), transação é uma unidade lógica de trabalho, em geral envolvendo diversas operações de banco de dados.

Uma transação começa com a execução da operação “BEGIN TRANSACTION” e termina com a execução das operações “COMMIT” ou “ROLLBACK”.

O **usuário** precisa ser **capaz** de **informar** no sistema quando operações distintas fazem parte da mesma transação.

### →As principais características da transação são:

- **Atomicidade:** é o princípio de que uma transação é uma unidade de processamento atômica. ou seja, a transação deve ser **realizada por completo** ou ela não deve ser realizada de forma alguma.
- **Consistência:** permite que uma transação seja executada até o fim sem que haja **interferência** de **outras transações**.
- **Durabilidade:** Transações também tem a garantia de serem **duráveis** (ou persistentes) no sentido de que, uma vez que uma transação execute uma operação “COMMIT” com sucesso, suas atualizações terão a garantia de serem aplicadas ao banco de dados, mesmo que ocorra alguma falha subsequente do sistema em determinado instante.
- **Isolamento:** Transações também tem a garantia de serem isoladas umas das outras, no sentido de que atualizações feitas no banco de dados por determinada transação T1 não se tornarão visíveis por qualquer transação T2 distinta, até e a menos que a T1 execute com sucesso uma operação “COMMIT”. A operação “COMMIT” faz com que as atualizações efetuadas pela transação T1 se tornem visíveis para outras transações. Por outro lado, se a transação executar a operação “ROLLBACK”, todas as alterações feitas pela transação serão canceladas (ou desfeitas).
- **Serialização:** A execução intercalada de um conjunto de transações concorrentes geralmente tem a garantia de ser **seriável**, no sentido de que ela produz o mesmo resultado que a execução dessas mesmas transações uma de cada vez em alguma **ordem serial** não especificada.

A técnica de bloqueio em duas fases para controle de concorrência é baseado no bloqueio de itens de dados, sendo que, chamamos de bloqueio uma variável que fica atrelada ao item de dados. Este bloqueio pode ser binário (possui valores: 1,0), logo, o item de dados está bloqueado ou não está bloqueado, permitindo que o item de dado só esteja acessível para uma transação apenas se a variável não estiver bloqueada (ou estiver com valor 0). São usadas duas operações para bloqueio binário, são elas: LOCK(1) e UNLOCK(0).

Quando o item de dados está sendo usado, o estado da variável é LOCK(1), assim que a transação encerra a utilização do item, é emitida a operação UNLOCK(0), então, o item já está disponível para outra transação.

---

## **DeadLock**

Um deadlock acontece quando duas ou mais transações bloqueiam uma à outra permanentemente, sendo que cada uma tem um bloqueio de uma informação que a outra transação está tentando bloquear.

O seguinte gráfico apresenta uma exibição de alto nível de um estado de deadlock, em que:

- A transação T1 tem um bloqueio na informação INFO1 (Indicado pela seta de INFO1 para T1) e solicitou um bloqueio na informação INFO2 (Indicado pela seta de T1 para INFO2)
- A transação T2 tem um bloqueio no recurso INFO2 (Indicado pela seta T2 a INFO2) e solicitou um bloqueio na informação INFO1 (Indicado pela seta de T2 para INFO1)
- Como nenhuma transação pode continuar até que uma informação esteja disponível e nenhuma informação pode ser liberada até que uma transação continue, ocorre um estado de deadlock

![Exemplo de Deadlock](./Imagens%20Caderno/exemplo-deadlock.png)

O mecanismo de banco de dados do SQL Server detecta ciclos de deadlock automaticamente dentro do SQL Server. O mecanismo de banco de dados escolhe uma das sessões como vítima de deadlock e a transação atual é encerrada com erro para quebrar o deadlock.

São causas que podem acelerar o deadlock:

- Bloqueios: Espera para adquirir bloqueios em tabelas ou partes de tabelas, linhas, metadados e aplicativos pode causar deadlock.
- Thread de Trabalho: Uma tarefa em fila aguardando um thread de trabalho pode causar deadlock.
- Memória: Quando solicitações simultâneas estão esperando por concessões de memória que não podem ser satisfeitas com a memória disponível, pode ocorrer um deadlock.
- Recursos relacionados à execução de consultas paralelas

---

## **Exercício (dinâmica):**

Há quatro níveis de isolamento definidos no padrão SQL-92. Eles podem auxiliar em problemas como deadlock.

**Explique as políticas de isolamento:**

- Read Uncommitted
- Read Commited
- Repeatable Read
- Serializable

---

## Segurança no Banco de Dados

As permissões de acesso no SQL Server são aplicadas aos usuários e funções do banco de dados.

Existem 3 tipos de permissões que podem ser configuradas:

- Grant: Concede explicitamente uma ou mais permissões.
- Deny: Nega explicitamente uma ou mais permissões à entidade de segurança.
- Revoke: Remove as permissões grant ou deny existentes.

Exemplo: Concedendo uma permissão no nível do servidor para um logon.

→ Grant control server to [TED]

As permissões podem ser atribuídas aos usuários, conforme algumas políticas, como:

- With grant option: Indica que o usuário autorizado também poderá conceder a permissão espeficada a outras entidades.
- Cascade: Indica que a permissão foi negada ou revogada para a entidade de segurança especificada e para todas as outras entidades de segurança às quais a entidade de segurança concedeu a permissão. Necessário quando a entidade de segurança tem a permissão com grant option.
- Grant option for: Indica que a habilidade de conceder a permissão especificada será revogada. Será necessário quando você estiver usando o argumento cascade.

Existem algumas regras com relação ao funcionamento das permissões e suas atribuições:

- Os membros das funções de banco de dados fixas DB.OWNER e DB.SECURITYADMIN podem conceder permissões ao banco de dados.
- Negar ou revogar permissões a uma entidade de segurança não afetará as solicitações com autorização aprovada que estiverem em execução no momento. Para restringir o acesso imediatamente, você precisa cancelar as solicitações ativas ou encerrar as sessões atuais.

---

# Herança no Banco de Dados

Herança na programação orientada a objetos é o mecanismo por meio do qual classes mais específicas incorporam a estrutura e o comportamento de suas classes superiores.

Herança é uma representação muito comum e ferramentas como Hibernate (Java) e Entity Framework (.NET), que realizam o mapeamento objeto versus relacional, suportam a representação de herança no Banco de Dados.

## Tipos de Herança no Hibernate

Existem 3 tipos de implementação de herança no Hibernate:

- Tabela única por hierarquia de classes
- Tabela por subclasse
- Tabela por classe concreta

Cada implementação possui vantagens e desvantagens, como por exemplo, uso de regras de negócio.

## Tabela Única por Hierarquia de Classes

Mesmo que existam as classes e superclasses distintas na orientação de objetos (Java), o Hibernate deve gerar apenas uma classe para representar todas elas. Considere, por exemplo, herança de tabela de “Pessoa Física”, “Pessoa Jurídica” e “Pessoa”.

![](./Imagens%20Caderno/tabela1.png)

Para representar através de uma única tabela, é preciso uma coluna para fazer a discriminação da pessoa física e pessoa jurídica.

![](./Imagens%20Caderno/tabela2.png)

![](./Imagens%20Caderno/tabela3.png)

Esta representação não está completamente normalizada.

## Tabela por Subclasse
Na representação "Tabela por subclasse" existe a superclasse e todas as suas filhas geradas fisicamente no banco de dados, sendo que em todas as classes filhas teremos uma chave estrangeira que apontará para a clase pai.

![](./Imagens%20Caderno/tabela4.png)

Apesar de normalizado, a pesquisa no banco de dados sempre deve requerer o "JOIN" entre os registros das tabelas para realizar a busca completa, do nome com o CPF.

## Tabela por Classe Concreta
Nesta representação são geradas apenas as classes concretas na base de dados. De acordo com o mesmo exemplo, apenas a pessoa jurídica e a pessoa física são criadas fisicamente no banco de dados.

![](./Imagens%20Caderno/tabela5.png)

Apesar de normalizado, a pesquisa no banco de dados sempre deve requerer a união entre os registros das tabelas para realizar a busca completa de todas as pessoas no banco de dados.

---

# Mineração de Dados

## Motivação

Crescimento rápido do tamanho e do número de bancos de dados disponíveis em:

- Aplicações comerciais;
- Indústria;
- Internet, etc.

Muitos dados X Pouca informação.

A mineração de dados surge como uma ferramenta poderosa para suprir a necessidade de descobrir informações úteis, tais como padrões escondidos em grandes bancos de dados.

---

## Conceito

Corresponde em aplicar a uma base de dados adequadamente preparada, algoritmos e técnicas para descoberta de padrões interessantes nesses dados.

É apenas uma etapa de um processo maior, conhecido como processo de descoberta de conhecimentos em bancos de dados

- KDD = Knowledge Discovery in Databases

---

![](./Imagens%20Caderno/tabela6.png)

---

## Tarefas de Mineração de Dados

- Mineração de Regras de Associação
- Mineração de Padrões Sequenciais
- Classificação
- Agrupamento
- Detecção de Anomalias (Outliers)

---

## Mineração de Regras de Associação

Problemas de minerar regras de associação:
- Dado um conjunto de registros, cada um contendo um número qualquer de itens.

- Encontrar regras de dependência que podem ser usadas para predizer a ocorrência de um item baseada na ocorrência de outros.

![](./Imagens%20Caderno/tabela7.png)

Algumas regras que poderiam ser Descobertas pelo software de mineração

{Pão} -> {Leite}
{Fralda, Leite} -> {Cerveja}

Uma regra é considerada interessante quando a mesma possui _suporte_ e _confiança_ superiores aos _valores mínimos_ fornecidos pelo usuário.

- Suporte de um item (ou conjunto de itens): números de transações em que o item aparece.

- Suporte de uma regra A -> B: número de transações em que aparecem os itens A U B.

- Confiança de uma regra A -> B: sup(A U B) / sup(A)

**Exemplo**: se o banco de dados abaixo fosse passado para o software de mineração e o usuário indicasse um suporte mínimo = 3 e confiança = 70%, pelo menos a regra {pão} -> {leite} seria descoberta pelo software de mineração.

![](./Imagens%20Caderno/tabela8.png)

## Marketing e Promoção de Vendas

- Considere que a seguinte regra tenha sido descoberta:

{Refrigerante, ...} -> {Batata Frita}

- **Batata Frita como conseqüente:** pode ajudar a determinar o que pode ser feito para aumentar as vendas de batata frita.

- **Refrigerante como antecedente:** pode ser usado para identificar quais produtos seriam afetados caso a loja deixasse de vender refrigerante.

Como aprimorar o negócio a partir da regra descoberta {pão} → {leite} ?

- **Estratégia 1:** colocar leite e pão próximos para encorajar a compra conjunta desses produtos quando o cliente visitar a loja.

- **Estratégia 2:** colocar leite e pão em lados opostos da loja pode levar o consumidor de tais produtos a comprar também outros itens no caminho.

- **Estratégia 3:** fazer uma promoção dos itens para venda conjunta.

Tem como objetivo identificar sequências de eventos 
(ou objetos) que ocorrem frequentemente em bancos 
de dados temporais.

- Descobrir a evolução de sintomas apresentados em pacientes.

- Descobrir a evolução das compras realizadas por clientes.

- Descobrir caminhos (sequências de páginas acessadas) na Web frequentemente percorridos pelos usuários

## Mineração de Padrões Sequenciais

![](./Imagens%20Caderno/tabela9.png)

O Padrão seqüencial acima seria descoberto se o usuário informasse o banco de dados à esquerda e por exemplo um **suporte mínimo de 50%**.

Assim, o mecanismo de mineração deve **encontrar todos os padrões seqüenciais**, de todos os tamanhos possíveis, que apareçam **em mais de 50% das seqüências de transações**.

## Padrões Sequenciais - Aplicações

### Marketing Direcionado

- Descobrindo um padrão seqüencial, como < {TV} , {DVD} > a empresa pode lançar uma **propaganda do produto DVD direcionada** àqueles **clientes que já compraram o produto TV**, sabendo que haverá **maior probabilidade de efetividade**.

- O padrão < {TV} , {DVD} > é um exemplo comum, mas o mecanismo de mineração pode encontrar muitos padrões importantes, não óbvios como este citado.
