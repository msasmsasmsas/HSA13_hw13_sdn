git init

git remote add origin https://github.com/msasmsasmsas/HSA13_hw13_sdn

git remote -v


docker exec client-europe dig carpic.com  # Повинен вернути IP europe балансувальника (10.30.0.10)
docker exec client-europe curl -I carpic.com/1.jpg  # В заголовках повинен быти x-load-balancer: lb-america



docker exec client-world dig carpic.com  # Повинен вернути IP word балансувальника  (10.30.0.11)
docker exec client-world curl -I carpic.com/1.jpg  # В заголовках повинен быти x-load-balancer: lb-world

word балансувальник з кешем
docker exec -it client-world siege -t5S -f /data/image-urls

europe балансувальник без кешем
docker exec -it client-europe siege -t5S -f /data/image-urls

docker exec -it client-europe wrk -c1000 -t10 -d5s http://carpic.com/1.jpg

