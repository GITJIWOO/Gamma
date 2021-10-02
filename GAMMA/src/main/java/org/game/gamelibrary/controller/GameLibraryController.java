package org.game.gamelibrary.controller;

import org.game.gameinfo.controller.GameInfoController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/library/*")
@AllArgsConstructor
public class GameLibraryController {

}
