# README

https://rails-project-64-nm6h.onrender.com

![Ruby on Rails CI](https://github.com/TheGor-365/rails-project-64/actions/workflows/rubyonrails.yml/badge.svg)
[![CI](https://github.com/TheGor-365/rails-project-64/actions/workflows/ci.yml/badge.svg)](https://github.com/TheGor-365/rails-project-64/actions/workflows/ci.yml)
[![Hexlet Check](https://github.com/TheGor-365/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/TheGor-365/rails-project-64/actions/workflows/hexlet-check.yml)

# rails-project-64 — Коллективный блог

Мини-блог с регистрацией пользователей, постами, лайками и комментариями. Проект учебный, заточен под чистую реализацию на стандартных механизмах Rails и Bootstrap без кастомных стилей.

## Функционал
- Регистрация/вход/выход пользователей (Devise)
- Создание постов
- Комментарии к постам (в т.ч. валидации)
- Лайки постов
- I18n (ru/en), переключатель локали
- Bootstrap UI, Turbo/Stimulus

## Стек
- Ruby **3.2.2**
- Rails **7.2.2.2**
- Node/Yarn (jsbundling-rails, cssbundling-rails)
- PostgreSQL/SQLite для dev/test (зависит от конфигурации проекта)
- Bootstrap (через cssbundling)

## Быстрый старт (локально)
```bash
# 1) Рантайм
# asdf (рекомендуется)
asdf local ruby 3.2.2

# 2) Зависимости
bundle install
yarn install

# 3) База данных
bin/rails db:prepare

# 4) Дев-сервер (Puma + esbuild + sass)
bin/dev
# или
bin/rails s
