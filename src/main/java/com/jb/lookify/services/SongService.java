package com.jb.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.jb.lookify.models.Song;
import com.jb.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepository;
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	public List<Song> allSongs() {
        return songRepository.findAll();
    }
	
	public Song createSong(Song s) {
        return songRepository.save(s);
    }
	
	public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
	
	public Song updateSong(Long id, String title, String artist, Integer rating) {
    	Optional<Song> updateSong = songRepository.findById(id);
    	if (updateSong.isPresent()) {
    		Song s = updateSong.get();
    		s.setTitle(title);
            s.setArtist(artist);
            s.setRating(rating);
            return songRepository.save(s);
    	}
    	else {
    		return null;
    	}
    }
	
	public Song updateSong(Song song) {
        return songRepository.save(song);
    }
	
    public void deleteSong(Long id) {
    	songRepository.deleteById(id);
    }
    
    public List<Song> findSongByArtist(String artist) {
    	return songRepository.findByArtistContaining(artist);
    }
    
    public List<Song> findTopTen() {
    	return songRepository.findTop10ByOrderByRatingDesc();
    }
}
