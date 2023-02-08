# FitnessOut API

This API is built with Express, Typescript and Prisma ORM

## Install

1. Clone the repo `git clone git@github.com:PasHdez/fitnessout.api.git`
2. Install node modules `npm i`
3. Create local environment file and add secrets `.env.development.local`
4. Gerate Prisma client `npm run prisma:generate`
5. Run Prisma migrations `npm run prisma:migrate`
6. Start development environment `npm run dev`

## Debug in VS Code

1. Start development environment `npm run dev`
2. Attach VS Code debugger to running node.js process

## Add migration

1. Modify `schema.prisma` to remove/add tables or columns
2. Run `npm run prisma:migrate`
3. Type a name for the migration
4. Run `npm run prisma:generate`

## Test

TBD

## Deploy

TBD
