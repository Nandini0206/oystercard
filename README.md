# Oystercard Challenge

The aim of this challenge was to build a more complex program which allowed me to further enhace my TDD and OOD skills.

I approached this challennge in the following way:

1. Wrote out the Rspec test that showed what I was aiming for as per the user stories.
2. Ran Rspec and used the error messages to write out the source-code.
3. Repeated this process until I had a fully functional passing test (green!).

## Goals

This weeks challenge focuses on the below goals:

**I write code that is easy to change**

Writing easy to change software is highly prized amongst developers and employers. By developers because most of a developer's time is spent changing software. By employers because their teams can deliver value to customers faster.

**I can test-drive my code**

Tested software is easier to change because you can tell when it's broken just by running a command, even the tricky edge cases.

**I can build with objects**

Most code in the world is structured in small pieces called objects. This is done because it is easier to change than having everything in one place. Weekly challenge user stories


## How to Use

1. Clone the repository and install required gems
```
$ git clone https://github.com/ayelishaamoah/oystercard.git
$ cd oystercard
$ bundle install
```
2. To run the program
```
$ cd oystercard
$ ruby oystercard.rb
```
3. Running tests
```
$ cd oystercard
$ rspec
```

## User Stories
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

