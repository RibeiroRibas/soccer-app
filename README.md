# Sorteia meu time aí! - app


# 1. Sobre o App

Aplicativo em flutter para Android e IOS em desenvolvimento . A idéia surgiu a partir de uma dificuldade que eu e muitos peladeiros temos para decidir quem vai escolher os times e, quando decide, o time fica totalmente desequilibrado. Outro impecílio que também perambula pelos gramados é a substituição dos jogadores, normalmente feito por tempo ou por gol sofrido, nesse app você vai poder configurar a partida para facilitar as substituições.

## Objetivo

O aplicativo tem como objetivo principal para sua primeira versão sortear de forma equilibrada, por posição, por overall e aleatória times de futebol na modalidades society ou futsal.

## Funcionalidades :hammer:

1. Sortear time de forma equilibrada.
2. Sortear times de forma Aleatória.
3. Sortear times por posição.
4. Sortear times por overall do jogador.
5. Cadastrar jogadores.
6. Cadastrar partida.
7. Interagir com a partida em andamento.
8. Salvar automaticamente os times sorteados após a partida.
9. Salvar automaticamente as partidas disputadas.
10. Mostrar histórico dde jogos.
11. Cadastrar configurações da partida.

## Características :scroll:

1. Dar suporte apenas para o modo retrado.
2. Funciona offline.
3. SO Android e IOS.
4. Dar suporte pra temas e cores diferentes.
  
# 2. Documentação

## Arquitetura

O projeto usa como modelo de arquitetura o padrão MVVM (model-view-viewmodel).
![mvvm](https://github.com/RibeiroRibas/soccer-app/assets/96504657/e64ce710-8d7f-4029-b2e2-dca5e13cd41e)

- `model:` É o modelo de domínio ou o modelo que representa os dados do backend. Modelos guardam informação mas não lidam com comportamento. Eles não formatam os dados e nem influenciam como eles serão apresentados.
- `view:` Essa é única parte da aplicação que o usuário interage diretamente. Todos os componentes visuais ficam nessa camada. Todos os eventos que aqui acontecem são enviados diretamente para o view model. A View não tem a responsabilidade de processar dados e muito menos lidar com estados.
- `viewmodel:` Camada que age como um intermediário entre a view e o model, processa os eventos antes de apresentar para a view. Também pode fornecer métodos para lidar com os estados da view. 

## Organizaçao dos pacotes

- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/3eb5d8b4-c9ae-444d-bc30-339c3161e579) - toda e qualquer imagem adicionada ao projeto.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/ec511c38-d16f-4dd6-a943-7acab965fe9f) - toda e qualquer font de texto adicionada ao projeto.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/a24907d3-e97b-4399-ae02-39e6a54ab7f3) - classes relacionadas com dados, como por exemplo ler ou escrever dados no smartphone.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/49cb90ff-355c-44f4-9bb9-0694a7283992) - classes modelo do projeto, as que tem relação direta 


## Nomenclaturas
