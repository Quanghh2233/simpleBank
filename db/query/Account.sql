-- name: CreateAccount :one
INSERT INTO "Account" (
  owner,
  balance,
  currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
SELECT * FROM "Account"
WHERE id = $1 LIMIT 1;

-- name: ListAccount :many
SELECT * FROM "Account"
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :one
UPDATE "Account"
SET balance = $2
WHERE id = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM "Account"
WHERE id = $1;