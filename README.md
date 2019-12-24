## Яндекс.Метрика в командной строке Ruby

Неоднократно приходилось слышать жалобы на чрезвычайно медленный веб-интерфейс Яндекс.Метрика. Моя рекомендация: господа-сеошники, переходите в консоль, веб-аналитика от компании Яндекс будет у вас летать...

Загрузите скрипт (требует ruby, также 'dotenv', 'typhoeus', 'json'), укажите идентификатор счетчика и токен авторизации в файле .env, и... запускайте магию. Используя [список группировок и метрик](https://yandex.ru/dev/metrika/doc/api2/api_v1/attrandmetr/dim_all-docpage) - крайне несложно изменять/добавлять параметры запроса, получая практически любую статистику посредством API Яндекс.Метрика.

```bash
ruby bin/start.rb

YANDEX.METRIKA. ALL-ROUND WEB ANALYTICS

*********** TOP 10 Visitors (without Russia, Ukraine and Belarus) by Countries ***********

United States
40
Kazakhstan
36
Netherlands
22
France
20
Uzbekistan
15
China
14
Germany
14
Azerbaijan
8
Czech Republic
8
Poland
7

*********** TOP 10 Visitors by Cities ***********

Moscow
453
Saint Petersburg
379
Kyiv
47
Minsk
42
Samara
36
Yekaterinburg
36
Krasnodar
35
Nizhny Novgorod
31
Novosibirsk
29
Rostov-na-Donu
27

*********** External Referers ***********

https://github.com/
6
https://php.ru/
6
https://extensions.joomla.org/
4
https://youtube.com/
4
https://catwar.su/
3
https://m.sogou.com/
3
http://progressive-seo.com
2
https://searchengines.guru/
2
https://virtuemart.su/
2
http://1c.taxpravo.ru/
1

```

Good luck! Но знайте, Google Analytics намного круче. :)
