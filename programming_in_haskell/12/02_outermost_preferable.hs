-- fst (1 + 2, 2 + 3)
-- Using outermost evaluation, unnecessary to evaluate 2 + 3

-- outermost
-- fst (1 + 2, 2 + 3)
-- = { applying fst }
-- 1 + 2
-- = { applying + }
-- 3

-- innermost
-- fst (1 + 2, 2 + 3)
-- = { applying the first + }
-- fst (3,     2 + 3)
-- = { applying + }
-- fst (3,         5)
-- = { applying fst}
-- 3
