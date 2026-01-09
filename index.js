const express = require('express');
const app = express();
const port = 8000;

app.get('/', (req,res) => {
    res.send('Aplicação online do App Runner')
})

const enviroment = process.env.NODE_ENV || 'nenhum ambiente'

const apiKey = process.env.API_KEY || 'nenhuma chave de API'

app.listen(port, () => {
    console.log(`Rodando na porta ${port} em ambiente de ${enviroment} tendo ${apiKey} como chave`)
});