<?php
require_once '../config/database.php';

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->prepare("
        SELECT 
            c.id AS categoria_id,
            c.nome AS categoria_nome,
            c.ordem,
            i.id AS item_id,
            i.nome AS item_nome,
            i.descricao,
            i.preco
        FROM categorias c
        INNER JOIN itens i ON i.categoria_id = c.id
        WHERE i.ativo = 1
        ORDER BY c.ordem, i.nome
    ");

    $stmt->execute();

    $rows = $stmt->fetchAll();

    $cardapio = [];

    foreach ($rows as $row) {
        $cat_id = $row['categoria_id'];
        if (!isset($cardapio[$cat_id])) {
            $cardapio[$cat_id] = [
                'categoria' => $row['categoria_nome'],
                'itens' => []
            ];
        }
        $cardapio[$cat_id]['itens'][] = [ 
            'id' => $row['item_id'],
            'nome' => $row['item_nome'],
            'descricao' => $row['descricao'],
            'preco' => (float) $row['preco']
        ];
    }
    echo json_encode(array_values($cardapio));
}