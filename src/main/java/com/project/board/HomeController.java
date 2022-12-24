package com.project.board;

import com.project.board.domain.board.controller.init.BoardInit;
import com.project.board.domain.board.domain.boardenum.Regions;
import com.project.board.domain.board.controller.response.BestDto;
import com.project.board.domain.board.repository.BoardRepository;
import com.project.board.domain.member.domain.searchInfo.searchCnt.CategoryCnt;
import com.project.board.domain.member.domain.searchInfo.SearchInfo;
import com.project.board.global.config.auth.PrincipalDetails;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController {
    private final BoardRepository boardRepository;
    private final BoardInit boardInit;


    @ModelAttribute("regions")
    public List<Regions> regions(){
        return boardInit.getRegions();
    }

    @GetMapping({ "", "/" })
    public String index(
            @PageableDefault(page = 0) Pageable pageable
            , Model model
    ) {
        Page<BestDto> bestDtos = boardRepository.searchBestInfo(pageable).map(board -> {
            try {
                return new BestDto(board);
            } catch (MalformedURLException e) {
                throw new RuntimeException(e);
            }
        });
        model.addAttribute("items", bestDtos.getContent());
        return "index";

    }

    @GetMapping("/login")
    public String loginForm(){
        return "loginForm";
    }

    @GetMapping("/recommand")
    public void recommand(@AuthenticationPrincipal PrincipalDetails principalDetails)
    {
        SearchInfo searchInfo = principalDetails.getMember().getSearchInfo();
        CategoryCnt category = searchInfo.getCategory();

    }

    @GetMapping("/error-404")
    public void error404(HttpServletResponse response) throws IOException {
        response.sendError(404, "404 오류!"); }
    @GetMapping("/error-500")
    public void error500(HttpServletResponse response) throws IOException {
        response.sendError(500);
    }


}
