<?php
// Copie este arquivo para database.php e preencha com suas credenciais de banco de dados
$host = 'localhost'; // ou o endereço do seu servidor de banco de dados
$dbname = 'seu_banco_de_dados_aqui'; // nome do seu banco de dados
$dbuser = 'seu_usuario_aqui'; // nome de usuário do banco de dados
$dbpass = 'sua_senha_aqui'; // senha do banco de dados

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8",
        $dbuser,
        $dbpass
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['erro' => 'Falha na conexão com o banco de dados:']);
    exit;
}