# Sistema de Pedidos para Restaurante

> Projeto de portfólio desenvolvido para praticar e consolidar habilidades em desenvolvimento web fullstack.

## Sobre o projeto

Sistema web de pedidos para restaurante com duas interfaces: uma pública para o cliente montar e enviar o pedido, e um painel administrativo para o restaurante acompanhar e gerenciar os pedidos em tempo real.

## Tecnologias utilizadas

- **Front-end:** HTML5, CSS3, JavaScript puro
- **Back-end:** PHP (sem frameworks)
- **Banco de dados:** MySQL
- **Ambiente local:** XAMPP
- **Comunicação:** Fetch API + Polling com setInterval

## Requisitos funcionais

### Cliente (público)
| ID | Descrição |
|----|-----------|
| RF01 | Visualizar cardápio organizado por categoria |
| RF02 | Adicionar, remover e ajustar quantidade de itens no carrinho |
| RF03 | Informar número da mesa antes de confirmar o pedido |
| RF04 | Enviar pedido e receber confirmação com ID gerado |

### Restaurante (painel)
| ID | Descrição |
|----|-----------|
| RF05 | Autenticar com usuário e senha via sessão PHP |
| RF06 | Visualizar todos os pedidos ativos com mesa, itens e status |
| RF07 | Atualizar status dos pedidos |
| RF08 | Gerenciar itens do cardápio (criar, editar, ativar/desativar, excluir) |
| RF09 | Receber atualização automática de novos pedidos via polling |

## Requisitos não funcionais

| ID | Descrição |
|----|-----------|
| RNF01 | Página pública responsiva (mobile-first) |
| RNF02 | Queries com prepared statements (proteção contra SQL injection) |
| RNF03 | Senhas armazenadas com `password_hash()` |
| RNF04 | Carrinho persistido no localStorage |
| RNF05 | Sem frameworks ou dependências externas |
| RNF06 | API responde em menos de 500ms |

## Regras de negócio

| ID | Descrição |
|----|-----------|
| RN01 | Pedido com carrinho vazio não pode ser enviado |
| RN02 | Status avança apenas na ordem: `novo → preparando → pronto → entregue` |
| RN03 | Itens inativos não aparecem no cardápio público, mas são mantidos no histórico |
| RN04 | O preço é registrado no momento do pedido — alterações futuras no cardápio não afetam pedidos já criados |
| RN05 | Número da mesa é obrigatório e deve ser um inteiro positivo |

## Estrutura de pastas
```
restaurante/
├── config/
│   └── database.php
├── api/
│   ├── cardapio.php
│   ├── pedidos.php
│   └── auth.php
├── painel/
│   ├── index.html
│   └── painel.js
├── public/
│   ├── index.html
│   ├── style.css
│   └── app.js
└── database/
    └── schema.sql
```

## Status do projeto

🚧 Em desenvolvimento

| Fase | Descrição | Status |
|------|-----------|--------|
| 1 | Banco de dados (schema + seed) | ⏳ Pendente |
| 2 | API do cardápio | ⏳ Pendente |
| 3 | Página do cliente | ⏳ Pendente |
| 4 | Criação de pedido (carrinho) | ⏳ Pendente |
| 5 | Painel do restaurante | ⏳ Pendente |
| 6 | Autenticação | ⏳ Pendente |
| 7 | Polling | ⏳ Pendente |
