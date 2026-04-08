# Sistema de Pedidos para Restaurante
> Projeto de portfólio desenvolvido para praticar e consolidar habilidades em desenvolvimento web fullstack.

## Sobre o projeto

Sistema web de pedidos para restaurante com duas interfaces: uma pública para o cliente montar e enviar o pedido via QR Code na mesa, e um painel administrativo para o restaurante acompanhar e gerenciar os pedidos em tempo real.

O pagamento é realizado de forma presencial pelo atendente ao final do atendimento, mantendo o fluxo tradicional do restaurante. A interface do cliente funciona como um cardápio digital interativo, sem eliminar o papel do atendente no processo.

## Tecnologias utilizadas

- **Front-end:** HTML5, CSS3, JavaScript puro
- **Back-end:** PHP (sem frameworks)
- **Banco de dados:** MySQL
- **Ambiente local:** XAMPP
- **Comunicação:** Fetch API + Polling com setInterval

## Fluxo principal de uso

1. Cliente escaneia o QR Code na mesa e acessa o cardápio digital
2. Cliente monta o pedido e envia pelo próprio celular
3. O pedido aparece automaticamente no painel do restaurante
4. O atendente ou cozinha visualiza e atualiza o status do pedido
5. O atendente realiza a cobrança presencialmente ao entregar ou ao final do atendimento

> **Alternativa:** o atendente pode lançar o pedido manualmente no painel, sem necessidade de interação do cliente com o celular.

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
| RF07 | Atualizar status dos pedidos (novo → preparando → pronto → entregue) |
| RF08 | Gerenciar itens do cardápio (criar, editar, ativar/desativar, excluir) |
| RF09 | Receber atualização automática de novos pedidos via polling |
| RF10 | Lançar pedido manualmente pelo painel, informando mesa e itens do cardápio |

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
| RN06 | O pagamento é sempre realizado presencialmente pelo atendente — o sistema não processa pagamentos |
| RN07 | Pedidos lançados manualmente pelo painel seguem o mesmo fluxo de status dos pedidos enviados pelo cliente |

## Estrutura de pastas
```text
restaurante/
├── .gitignore
├── README.md
├── config/
│   └── database.example.php
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

## Como rodar localmente

1. Clone o repositório
2. Copie `config/database.example.php` para `config/database.php`
3. Preencha `database.php` com suas credenciais do MySQL
4. Importe `database/schema.sql` no phpMyAdmin
5. Acesse `http://localhost/restaurante/public`

## Status do projeto

🚧 Em desenvolvimento

| Fase | Descrição | Status |
|------|-----------|--------|
| 1 | Banco de dados (schema + seed) | ✅ Concluído |
| 2 | API do cardápio | 🚧 Em andamento |
| 3 | Página do cliente | ⏳ Pendente |
| 4 | Criação de pedido (carrinho) | ⏳ Pendente |
| 5 | Painel do restaurante | ⏳ Pendente |
| 6 | Autenticação | ⏳ Pendente |
| 7 | Polling | ⏳ Pendente |

## Possíveis evoluções futuras

| # | Funcionalidade | Observação |
|---|---------------|------------|
| 1 | Integração com pagamento online | Ex: Pix via API do banco ou gateway como Mercado Pago |
| 2 | Impressão automática do pedido na cozinha | Integração com impressora térmica via backend |
| 3 | Histórico e relatórios de vendas | Filtros por período, produto mais vendido, ticket médio |
| 4 | Suporte a múltiplos perfis de acesso | Controle por perfil: admin, cozinha, caixa |
| 5 | Notificação em tempo real com WebSocket | Substituição do polling por conexão persistente |
| 6 | Cardápio com fotos dos itens | Upload de imagens e exibição na interface do cliente |
| 7 | Aplicativo mobile (PWA) | Tornar a interface do cliente instalável no celular |
