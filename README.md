# Secure Attendance & Access Control (Databricks)

Aplicação em Streamlit rodando no Databricks para controle seguro de presença em reuniões via link dinâmico com validação de acesso.

---

## Funcionalidades

* Check-in via link único (`token`)
* Validação de CPF
* Controle de acesso por horário (5 min antes até 1h depois)
* Expiração automática e desativação manual de links
* Registro em Delta Tables (Databricks)
* Redirecionamento automático para Google Meet
* Bloqueio de acessos fora da janela permitida

---

## Camada Analítica

O projeto inclui uma camada de analytics pronta para uso:

### Views disponíveis

* `vw_presenca` → base consolidada com atraso e validação de presença
* `vw_indicadores_reuniao` → métricas por reunião
* `vw_indicadores_gerais` → visão consolidada
* `vw_duplicidade` → controle de múltiplos check-ins

### Métricas geradas

* Total de check-ins
* Participantes únicos
* Taxa de presença válida (%)
* Atraso médio (min)
* Primeiro e último acesso
* Duplicidade de CPF

---

## Arquitetura

* **Frontend:** Streamlit (Databricks Apps)
* **Backend:** Databricks SQL Warehouse
* **Storage:** Delta Tables
* **Segurança:** Token via query param (`hash_link`)

---

## Estrutura do Projeto

```
.
├── app.py
├── requirements.txt
├── setup.sql/
│   ├── 01_create_tables.sql
│   ├── 02_seed_data.sql
│   ├── 03_views.sql
├── runbook.md
```

---

## Quick Start

1. Execute o setup completo:

```sql
-- executar setup/setup.sql
```

2. Faça o deploy do app no Databricks Apps

3. Gere um link de acesso:

```sql
SELECT CONCAT('<app-url>?token=', hash_link)
FROM apost_meetings
```

4. Acesse o link no navegador e realize o check-in


## Segurança

* Links protegidos por `hash_link`
* Expiração configurável (`expira_em`)
* Desativação manual (`ativo = false`)
* Validação dupla de horário (UI + backend)

---

## Casos de Uso

* Monitoramento de presença em contextos clínicos
* Controle de participação em grupos terapêuticos
* Gestão de reuniões corporativas
* Acompanhamento de engajamento em sessões online

---

## Roadmap

* Dashboard de presença (Databricks SQL / Power BI)
* Bloqueio de duplicidade em tempo real
* Geração automática de tokens
* Interface administrativa para criação de reuniões

---

## Autora

Larissa Borges
