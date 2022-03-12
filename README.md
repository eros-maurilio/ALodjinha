![alodjinha](https://user-images.githubusercontent.com/86015861/158024138-0ce9a247-d59b-4645-93d8-3d9c08af9c45.png)
<p>&nbsp;</p>

## Geral 🔍
Um desafio técnico criado pela empresa [AmeDigital](https://github.com/AmeDigital). O desafio completo pode ser encontrado em: [aLodjinha](https://github.com/AmeDigital/challenge-ios).

### Demo 👾
![ezgif-2-5d1a5b59b9](https://user-images.githubusercontent.com/86015861/158022864-fdb55393-3fe3-489c-a00f-239f601274a8.gif)

<p>&nbsp;</p>

## Home 🏠
#### Premissa ❗️
- [x] A tela de Home deve ser acessada ao tocar a opção Home do Tab Bar, conforme protótipo.
- [x] O tamanho total da tela de Home deve ser determinada pelo tamanho total de todos as views somadas; ou seja, não deverá haver sub-scroll vertical.
- [x] Ao exibir qualquer Funcionalidade externa acessada pela Home, a Tab Bar não deve aparecer.

#### Funcionalidade 01 ⚙️
- [x] Exibir a barra de banners rotativo.
- [x] Cada banner deve preencher todo o espaço horizontal da tela.
- [x] Ao realizar o swipe left ou swipe right, o banner deve ser trocado pelo próximo ou anterior, conforme disponibilidade.
- [x] Utilizar um indicador para facilitar ao usuário saber quantos banners existem e em qual posição ele está.

#### Funcionalidade 02 ⚙️
- [x] Exibir um menu deslizável horizotal com as categorias.
- [x] Ao clicar em uma categoria, o app deve redirecionar o usuário para a Funcionalidade 04.

#### Funcionalidade 03 ⚙️
- [x] Exibir uma lista dos produtos mais vendidos.
- [x] O usuário deve ser direcionado à Funcionalidade 05.

#### Screenshot da Home 📸
<img src="https://user-images.githubusercontent.com/86015861/156811990-e3588084-fc3f-49d1-abf5-b29a1258044a.jpeg" width=30% height=30%>

<p>&nbsp;</p>

## Listagem da Categoria 📖
#### Premissa ❗️
- [x] A Tab Bar não deve ser exibida.
- [x] Ao voltar para Home, a Tab Bar deve voltar a ser exibida.
- [x] Um indicador de loading deve ser exibido enquanto uma nova página estiver sendo carregada.
- [x] O usuário não deve ficar com a rolagem e navegação travados enquanto uma nova página estiver sendo carregada.

#### Funcionalidade 04 ⚙️
- [x] Exibir uma lista dos produtos da categoria selecionada.
- [ ] A lista possui um número desconhecido de produtos, e deverá ser paginado, limitando a página em 20 registros. _(Não há limite de paginação pela API)_
- [x] Ao tocar em um produto, o usuário deverá ser direcionado à Funcionalidade 05.

#### Screenshot da Listagem da Categoria 📸
<img src="https://user-images.githubusercontent.com/86015861/156819539-13a6928e-d7b8-4fb1-8b2b-b004ff2bbabf.jpeg" width=30% height=30%>

## Exibição de Produto 🛒
#### Premissa ❗️
- [x] A Tab Bar não deve ser exibida.
- [x] Se exibida a partir da Home, ao voltar, a Tab Bar deve ser exibida novamente.

#### Funcionalidade 05 ⚙️
- [x] Exibir a descrição do produto conforme protótipo.
- [x] O botão Reservar deve estar sempre visível, fixado na parte de baixo da tela.
- [x] O app deve tratar em HTML e exibí-lo corretamente (negrito, itálico, etc).

#### Funcionalidade 06 ⚙️
- [x] Ao clicar no botão Reservar, o app deve efetuar a reserva do produto com o servidor.
- [x] Exibir a mensagem de sucesso ou erro da reserva.
- [x] O usuário não deve poder tocar outra vez no botão enquanto a primeira reserva não for concluída.
- [x] Se a reserva for concluída com sucesso, após fechar a mensagem de sucesso, retornar para a tela que chamou a Exibição de Produto.

#### Screenshot da Tela de Produto 📸
<img src="https://user-images.githubusercontent.com/86015861/158022036-dd719cb6-f961-4b3d-915f-73518657ee22.jpeg" width=30% height=30%>

<p>&nbsp;</p>

## Sobre 💬
#### Premissa ❗️
- [x] A tela de Sobre deve ser acessada ao tocar a opção Home do Tab Bar.

#### Funcionalidade 07 ⚙️
- [x] Exibir o logo e o nome do app. Na parte de baixo da tela, exibir o nome do desenvolvedor (seu nome) e a data de desenvolvimento.

#### Screenshot Sobre 📸
<img src="https://user-images.githubusercontent.com/86015861/158022568-db284529-f4f2-4ed6-8b3f-beb83db26f04.jpeg" width=30% height=30%>

<p>&nbsp;</p>

## Extras 💥
- Cobertura de testes atual: 36.4%
- iOS 9.0+
- Apenas bibliotecas nativas
- MVVM

<p>&nbsp;</p>

## Importante ⚠️
Por se tratar de um desafio antigo alguns ícones e imagens estão indisponíveis, para contornar esse problema inclui placeholders no lugar. Além disso, identifiquei que há uma discrepância entre a ID de alguns produtos e a sua lista de detalhes, ou seja, pela API, ao clicar em um produto X o usuário pode acabar vendo um item diferente do solicitado.
