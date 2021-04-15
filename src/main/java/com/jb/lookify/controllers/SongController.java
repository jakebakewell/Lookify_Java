package com.jb.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.lookify.models.Song;
import com.jb.lookify.services.SongService;

@Controller
public class SongController {
	private final SongService songService;
	public SongController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "dashboard.jsp";
	}
	
	@RequestMapping("/songs/{id}")
	public String showSong(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
    	model.addAttribute("song", song);
    	return "song.jsp";
	}
	
	@RequestMapping(value="/songs/delete/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
        songService.deleteSong(id);
        return "redirect:/dashboard";
    }
	
	@RequestMapping("/songs/new")
	public String newSong(Model model) {
		model.addAttribute("song", new Song());
		return "new.jsp";
	}
	
	@RequestMapping(value="/dashboard", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
            songService.createSong(song);
            return "redirect:/dashboard";
        }
    }
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(@RequestParam(value="search-artist") String searchArtist) {
		String string = String.format("redirect:/search/%s", searchArtist);
		return string;
	}
	
	@RequestMapping("/search/{artistString}")
	public String showSearchResult(@PathVariable("artistString") String artistString, Model model) {
		List<Song> songs = songService.findSongByArtist(artistString);
		model.addAttribute("artistString", artistString);
		model.addAttribute("songs", songs);
		return "search.jsp";
	}
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model) {
		List<Song> songs = songService.findTopTen();
		model.addAttribute("songs", songs);
		return "topTen.jsp";
	}
	
}
