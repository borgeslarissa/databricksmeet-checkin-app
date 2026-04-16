-- ========================================
-- TABELA: MEETINGS
-- ========================================
CREATE TABLE IF NOT EXISTS ameetings (
    meeting_id STRING,
    titulo STRING,
    horario TIMESTAMP,
    meet_link STRING,

    -- CONTROLE DE ACESSO
    hash_link STRING,

    -- CONTEXTO DO GRUPO
    grupo STRING,
    tipo_grupo STRING,

    -- CONTROLE DE LINK
    ativo BOOLEAN DEFAULT true,
    expira_em TIMESTAMP,

    -- METADATA
    created_at TIMESTAMP DEFAULT current_timestamp()
);

-- ========================================
-- TABELA: RESPOSTAS (CHECK-IN)
-- ========================================
CREATE TABLE IF NOT EXISTS meet_respostas (
    meeting_id STRING,
    nome STRING,
    email STRING,
    cpf STRING,
    data_resposta TIMESTAMP
);
