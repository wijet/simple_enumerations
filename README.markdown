Simple Enumerations
==================

Provides simple and clean enumerations system for rails apps.
Enumerations are defined in one file and stored in the database, as strings.

Installation
============

    script/plugin install git://github.com/wijet/simple_enumerations.git

Usage
=====

    # config/enumerations.yml
    policy:
      - open
      - closed
      - by approval

    # app/models/group.rb
    class Group < ActiveRecord::Base
      has_enumerated :policy
    end

You can generate sample enumerations file by running 

    script/generate enumerations

Plugin generates following methods:

    @group.policy.open?
    @group.policy.closed?
    @group.policy.by_approval?
    
Fetching enumerations 

    Enumeration[:policy] # => ['open', 'closed', 'by approval']
    Enumeration.all # => {'policy' => ['open', 'closed', 'by approval']}
    
Using enumeration in case statements is very easy

    case @group.policy
      when :open then ...
      when :closed then ...
      when :by_approval then ...
    end

Plugin includes helper for creating select boxes

    f.select_enumeration :policy

REQUIREMENTS
============

rails >= 2.1

LICENSE
=======

(The MIT License)

Copyright (c) 2009 Mariusz Pietrzyk (wijet at wijet dot pl)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
