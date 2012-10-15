require 'spec_helper'

describe Inflector, '#singular' do
  # ==== exceptional cases

  PluralToSingular = {
    'equipment' => 'equipment',
    'postgres' => 'postgres',
    'mysql' => 'mysql',
    'information' => 'information',
    'money' => 'money',
    'species' => 'species',
    'series' => 'series',
    'fish' => 'fish',
    'sheep' => 'sheep',
    'news' => 'news',
    'rain' => 'rain',
    'milk' => 'milk',
    'moose' => 'moose',
    'hovercraft' => 'hovercraft',
    'cacti' => 'cactus',
    'cactuses' => 'cactus',
    'thesauri' => 'thesaurus',
    'matrices' => 'matrix',
    'Swiss' => 'Swiss',
    'lives' => 'life',
    'wives' => 'wife',
    'geese' => 'goose',
    'criteria' => 'criterion',
    'aliases' => 'alias',
    'statuses' => 'status',
    'axes' => 'axis',
    'crises' => 'crisis',
    'testes' => 'testis',
    'children' => 'child',
    'people' => 'person',
    'potatoes' => 'potato',
    'tomatoes' => 'tomato',
    'buffaloes' => 'buffalo',
    'torpedoes' => 'torpedo',
    'quizzes' => 'quiz',
    'vertices' => 'vertex',
    'indices' => 'index',
    'indexes' => 'index',
    'oxen' => 'ox',
    'mice' => 'mouse',
    'lice' => 'louse',
    'theses' => 'thesis',
    'thieves' => 'thief',
    'analyses' => 'analysis',
    'octopi' => 'octopus',
    'grass' => 'grass',
    'phenomena' => 'phenomenon',
    'drives' => 'drive',
  # ==== bugs, typos and reported issues

  # ==== rules

    'forums' => 'forum',
    'hives' => 'hive',
    'athletes' => 'athlete',
    'dwarves' => 'dwarf',
    'heroes' => 'hero',
    'zeroes' => 'zero',
    'men' => 'man',
    'women' => 'woman',
    'sportsmen' => 'sportsman',
    'branches' => 'branch',
    'crunches' => 'crunch',
    'trashes' => 'trash',
    'mashes' => 'mash',
    'crosses' => 'cross',
    'errata' => 'erratum',
  # FIXME: add -ia => -ium cases

  # FIXME: add -ra => -rum cases

    'rays' => 'ray',
    'sprays' => 'spray',
  # Merriam-Webster dictionary says
  # preys is correct, too.
    'preys' => 'prey',
    'toys' => 'toy',
    'joys' => 'joy',
    'buys' => 'buy',
    'guys' => 'guy',
    'cries' => 'cry',
    'flies' => 'fly',
    'foxes' => 'fox',
    'elves' => 'elf',
    'shelves' => 'shelf',
    'pluses' => 'plus',
    'cats' => 'cat',
    'rats' => 'rat',
    'roses' => 'rose',
    'projects' => 'project',
    'posts' => 'post',
    'articles' => 'article',
    'locations' => 'location',
    'friends' => 'friend',
    'links' => 'link',
    'urls' => 'url',
    'accounts' => 'account',
    'servers' => 'server',
    'fruits' => 'fruit',
    'maps' => 'map',
    'incomes' => 'income',
    'pings' => 'ping',
    'events' => 'event',
    'proofs' => 'proof',
    'typos' => 'typo',
    'attachments' => 'attachment',
    'downloads' => 'download',
    'assets' => 'asset',
    'jobs' => 'job',
    'cities' => 'city',
    'packages' => 'package',
    'commits' => 'commit',
    'versions' => 'version',
    'documents' => 'document',
    'editions' => 'edition',
    'movies' => 'movie',
    'songs' => 'song',
    'invoices' => 'invoice',
    'products' => 'product',
    'books' => 'book',
    'tickets' => 'ticket',
    'games' => 'game',
    'tournaments' => 'tournament',
    'prizes' => 'prize',
    'prices' => 'price',
    'installations' => 'installation',
    'dates' => 'date',
    'schedules' => 'schedule',
    'arenas' => 'arena',
    'spams' => 'spam',
    'rice' => 'rice'
  }

  PluralToSingular.each do |plural, singular|
    pending "should signularize #{plural} => #{singular}" do
      Inflector.singularize(plural).should eql(singular)
    end
  end
end
