CASTLE24H = {
	castleNome = "[Castle 24H]", -- Prefixo que ir� aparecer nas mensagens
	mensagemPrecisaGuild = "Voc� n�o faz parte de nenhuma guild.", -- Mensagem que ir� aparecer caso o player n�o tenha guild
	mensagemGuildDominante = "O castelo j� � da sua guild.", -- Mensagem caso o player tente dominar o castelo mesmo sendo da sua guild
	mensagemGuildNaoDominante = "O castelo n�o � da sua guild", -- Caso o castelo n�o seja da guild do player
	mensagemLevelMinimo = "Voc� n�o tem level suficiente para invadir o castelo.", -- Caso o player n�o tenha nível para entrar
	mensagemBemvindo = "Seja bem vindo ao seu castelo.", -- Mensagem de bem-vindo à guild dominante
	levelParaDominar = true, -- true para precisar de nivel para dominar e false para n�o precisar
	level = 100, -- caso o levelParaDominar seja true, qual o nivel?
	tempoAvisar = 10, -- Tempo em SEGUNDOS para n�o ficar spammando que o player est� invadindo
}

function CASTLE24H:getGuildIdFromCastle()
  local guildId  = -1
  local resultId = db.storeQuery("SELECT `guild_id` FROM `castle`;")
  if (resultId ~= false) then
    guildId = result.getDataInt(resultId, "guild_id")
    result.free(resultId)
  end
  return guildId
end
