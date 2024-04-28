# IndieTrippers

Projeto desenvolvido durante a hackatur do salão internacional de turismo em 2024, realizado em Roraima.

A ideia consiste numa aplicação de geração de roteiros baseados no perfil do usuário, levando em considerações questões como qual será o tipo de viagem (business, casal, aventura, ecoturismo), e utilizando de inteligencia artificial e machine learning (futuramente) para melhorar os algoritmos e montar roteiros perfeitos para aquele usuário.

Mais detalhes sobre a parte de business (que está bem desenvolvida e com muitas ideias de escalabilidade) do projeto, pode checar na documentação do notion: https://www.notion.so/Hackathon-d7bb2aedb4f5467c92f1fe4840bea56e?pvs=4


O repositório consiste em duas pastas, uma é uma versão interativa num terminal, onde você insere uma query/termo, e ele retorna uma lista de locais relacionados ao termo a partir da API do TripAdvisor. A partir disso, você pode recuperar dados de restaurantes, atrações e hotéis dos locais.

A versão mobile, por outro lado, após inserir a query, ele busca a latitude e longitude de um lugar específico, e começa a fazer perguntas para entender o perfil do usuário, qual seu budget, qual seu tipo de viagem favorito, como ele quer organizar suas finanças, mas não está finalizado.

Já tendo uma parte que acessa hotéis, restaurantes e atrações a partir de um local (lat e long), e outra parte que armazena e entende o perfil (preferências, orçamento...) do usuário, falta apenas integrar as duas.


## Screenshots backend / terminal

![welcome](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/bbf00116-fd6c-4b79-89dd-2328bcf695d4)

![whereyougo](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/db12b773-1f0f-4652-871b-b929dc06a84a)

![hotels](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/482b09e5-29a5-4711-9c29-adc9c12bb9fa)

## Screenshots mobile

![image](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/63839c39-88d9-4615-a2b7-8fb99c0af2da)
![image](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/e1ead920-76a9-459e-af22-8f5a6eb7049c)
![image](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/19d48725-8093-4aa9-aec6-5b1f91926d87)
![image](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/980de631-acd9-4acb-9136-a463bac69d4a)
![image](https://github.com/ernanyJ/indietripper-hackatur/assets/124080522/d6e57864-085e-4077-82b3-763a4510e1c6)




(OBS) A API KEY UTILIZADA PARA RECUPERAR OS DADOS FOI DESATIVADA, VISTO QUE ESTAVA VINCULADA AO CARTÃO DE CRÉDITO PESSOAL DE UM DOS MEMBROS DA EQUIPE.
