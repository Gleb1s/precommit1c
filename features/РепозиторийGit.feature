# language: ru

Функционал: Выполнение операций с репозиторием Git
    Как Пользователь
    Я хочу иметь возможность выполнять различные операции с репозиторием Git
    Чтобы я мог проще устанавливать precommit1c в свой репозиторий

Контекст:
    Допустим Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю каталог проекта в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    И Я установил рабочий каталог как текущий каталог
    И Я выполняю команду "git" с параметрами 'init'

Структура сценария: Проверка настроек репозитория Git (простой отрицательный) - <Настройка>
    Дано Я копирую файл "v8files-extractor.os" из каталога "" проекта в подкаталог ".git/hooks" рабочего каталога
    И Я выполняю команду "git" с параметрами "config --local core.quotepath false"
    И Я выполняю команду "git" с параметрами "config --local core.longpaths true"
    И Я выполняю команду "git" с параметрами <Настройка>
    Когда Я выполняю команду "oscript" с параметрами '.git/hooks/v8files-extractor.os --git-check-config'
    Тогда вывод команды "oscript" содержит "У текущего репозитария не заданы необходимые настройки!"

Примеры:
    |Настройка|
    |config --local core.quotepath true|
    |config --local core.longpaths false|

Сценарий: Проверка настроек репозитория Git (простой положительный)
    Дано Я копирую файл "v8files-extractor.os" из каталога "" проекта в подкаталог ".git/hooks" рабочего каталога
    И Я выполняю команду "git" с параметрами "config --local core.quotepath false"
    И Я выполняю команду "git" с параметрами "config --local core.longpaths true"
    Когда Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!"

Сценарий: Установка precommit1c в репозиторий
    Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/v8files-extractor.os --install"
    И Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда в рабочем каталоге установлен precommit
    И вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!" 

Структура сценария: Установка precommit1c в репозиторий с параметрами: <Параметры>
    Когда Я устанавливаю Precommit в рабочий каталог с параметрами <Параметры>
    И Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда в рабочем каталоге установлен precommit
    И Файл хука в репозитории рабочего каталога содержит <Параметры>
    И вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!" 

Примеры:
    |Параметры|
    |--use-designer|
    |--remove-orig-bin-files|
    |--ib-connection-string /Fc:/test/ib --ib-user UserTest --ib-pwd ********|
    |--use-designer --remove-orig-bin-files|
    |--use-designer --ib-connection-string /Fc:/test/ib --ib-user UserTest --ib-pwd ********|
    |--remove-orig-bin-files --ib-connection-string /Fc:/test/ib --ib-user UserTest --ib-pwd ********|
    |--use-designer --remove-orig-bin-files --ib-connection-string /Fc:/test/ib --ib-user UserTest --ib-pwd ********|
