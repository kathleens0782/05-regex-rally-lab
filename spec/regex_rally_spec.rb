require 'spec_helper'

describe "Working with Regular expressions" do
  it "matches character string" do
    my_regex = /foo/
    match = %w{ afoot catfoot dogfoot fanfoot
    foody foolery foolish fooster footage
    foothot footle footpad footway hotfoot
    jawfoot mafoo nonfood padfoot prefool
    sfoot unfool }

    do_not_match = %w{ Atlas Aymoro Iberic Mahran Ormazd Silipan
    altared chandoo crenel crooked fardo folksy forest hebamic
    idgah manlike marly palazzi sixfold tarrock unfold }

    match.each do |word|
      expect(my_regex).to match(word)
    end

    do_not_match.each do |word|
      expect(my_regex).to_not match(word)
    end
  end

  it "uses anchors for matching" do
    my_regex = /ick$/

    match = %w{ Mick Rick allocochick backtrick bestick
    candlestick counterprick heartsick lampwick
    lick lungsick potstick quick rampick
    rebrick relick seasick slick tick
    unsick upstick }

    do_not_match = %w{ Kickapoo Nickneven Rickettsiales
    billsticker borickite chickell fickleness
    finickily kilbrickenite lickpenny mispickel
    quickfoot quickhatch ricksha rollicking
    slapsticky snickdrawing sunstricken tricklingly
    unlicked unnickeled }

    match.each do |word|
      expect(my_regex).to match(word)
    end

    do_not_match.each do |word|
      expect(my_regex).to_not match(word)
    end
  end

  it "Uses ranges for matching" do
    my_regex = /^[a-f]+$/
    match = %w{ abac accede adead babe
    bead bebed bedad bedded bedead bedeaf
    caba caffa dace dade daff dead deed deface
    faded faff feed }

    do_not_match = %w{ beam buoy canjac chymia
    corah cupula griece hafter idic lucy martyr
    matron messrs mucose relose sonly tegua
    threap towned widish yite }

    match.each do |word|
      expect(my_regex).to match(word)
    end

    do_not_match.each do |word|
      expect(my_regex).to_not match(word)
    end
  end

  it "matches valid email address" do
    # Don't use the crazy one from the RFC!
    my_regex = /^[\w.]+@[\w.]+\.com?\.?\w{2}?$/

    match = %w{steven@flatironschool.com john.doe@example.com phil@example.co.uk }
    do_not_match = ["steven@flatironschool", "user at example.com", "user@example.com@example.com"]

    match.each do |word|
      expect(my_regex).to match(word)
    end

    do_not_match.each do |word|
      expect(my_regex).to_not match(word)
    end
  end

  it "matches phone numbers" do
    my_regex = /\d/
    match = ["702-386-5397", "2128675309", "(212) 867-5309"]
    do_not_match = ["123", "this isn't a number", "12345678900000"]

    match.each do |word|
      result = word.scan(my_regex)
      expect(result.count).to eq(10)
    end

    do_not_match.each do |word|
      result = word.scan(my_regex)
      expect(result.count).to_not eq(10)
    end
  end
end
