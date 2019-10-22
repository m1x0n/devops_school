1. Необходимо в блоке http в секции log_format добавить '$cookie_USER_ID'.
2. Один из серверов находящийся за load-balancerом может оказаться перегруженым
если, к примеру, он будет одновременно обслуживать большое количетсво сесиий
или какая-либо из сессий окажется ресурсоёмкой. В таком случае load-balancer
может переключить(нарушая session stickiness) часть запросов на менее нагруженный сервер во время текущей сессии,
что может привести к потере данных.
3. Expires или Cache-Control max-age - для указания конфигурации кеширования
   Last Modified или Etag - для валидаци содержимого (изменилось или нет)
   Vary - для загрузки данных из кеша только когда необходимо проверить совпадение всех
заголовоков, перечисленных в Vary.
4. Можно собрать nginx с модулем stub-status (--with-http_stub_status_module).
Этот модуль предоставляет переменную $connections_active.
5. ALB поддерживает протокол(расширение TLS) "умного" выбора сертификатов Server Name Indication(SNI),
который в свою очередь позволяет добавить до 25 дополнительных не считая сертификата по-умолчанию.
6. На каждое соединение будет отведено 2 дескриптора. Итого 29 * 2 = 58.
Обычно в системе отведено число значительно большее (prlimit -n) = 1024 для soft limit.
Это же значение использьуется по умолчанию в nginx worker_rlimit_nofile.
Скорее всего менять настройки даже не придется.
7. Cdn может ускорить отдачу динамического контента, выполняя некоторые мехнанизмы кеширования запросов
на своей стороне. Так, например, может работать Amazon CloudFront и Cloudflare.
В случае с CloudFront, запрос от пользователя попадает на один из узлов CloudFront c наименьшей latency к клиенту,
на котором проверяется наличие контента в кэше. Если контента не было, то запрос перенаправляется на origin сервер,
кешируется и отдается клиенту.
8.https://hub.docker.com/r/m1x0n/nginx-image-resizer
