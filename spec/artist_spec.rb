require 'rspec'
require 'album'
require 'song'
require 'artist'
require 'pry'

describe '#Artist' do

  before(:each) do
    Album.clear
    Song.clear
    Artist.clear
  end

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist = Artist.new({:name => "Trent Reznor", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Pogo", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "Trent Reznor", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Pogo", :id => nil})
      artist2.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({:name => "Pogo", :id => nil})
      artist2 = Artist.new({:name => "Pogo", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "Trent Reznor", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Pogo", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end
  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new({:name => "Trent Reznor", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Pogo", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "Mac Demarco", :id => nil})
      artist.save()
      album = Album.new({:name => "Trent Reznor", :id => nil})
      album.save()
      artist.update({:album_name => "Trent Reznor"})
      expect(artist.albums).to(eq([album]))
    end
  end
end
