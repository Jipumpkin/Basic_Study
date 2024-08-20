package MusicPlayer;

import java.util.ArrayList;
import java.util.Scanner;

import javazoom.jl.player.MP3Player;

public class Main {

	public static void main(String[] args) {
		
		
		// 1) 외부 라이브러리 적용하기 - player.jar
		
		MP3Player mp3 = new MP3Player();
		
		Controller con = new Controller();
		
//		mp3.play("C:\\Users\\USER\\Desktop\\music\\sakayume.mp3");
		
		
		//노래 한곡
		//가수, 노래제목, 플레이시간, 경로
		// > music
		// music 클래스를 사용해서 10개의 객체 생성
		
		// 1) music 자료형을 관리하는 ArrayList를 하나 생성
		// musicList
		
		
		// 2) music1 ~ music10 ArrayList에 담기
		
		
        String defaultPath = "C:\\Users\\user\\Desktop\\music\\";
        Music m1 = new Music(defaultPath + "Anne Marie - 2002.mp3", "2002", "Anne Marie", 257);
        Music m2 = new Music(defaultPath + "Billie Eilish - bad guy.mp3", "bad guy", "Billie Eilish", 277);
        Music m3 = new Music(defaultPath + "Carmen Twillie, Lebo M. - Circle of Life.mp3", "Circle of Life", "Carmen Twillie, Lebo M.", 257);
        Music m4 = new Music(defaultPath + "CHUNG HA - 벌써 12시.mp3", "벌써 12시", "CHUNG HA", 182);
        Music m5 = new Music(defaultPath + "sakayume.mp3", "Sakayume", "King Gnu", 306);
        Music m6 = new Music(defaultPath + "Itzy - Dalla Dalla.mp3", "Dalla Dalla", "Itzy", 233);
        Music m7 = new Music(defaultPath + "JENNIE - SOLO.mp3", "SOLO", "JENNIE", 198);
        Music m8 = new Music(defaultPath + "Mena Massoud, Naomi Scott - A Whole New World.mp3", "Mena Massoud, Naomi Scott", "A Whole New World", 222);
        Music m9 = new Music(defaultPath + "Rain - 깡.mp3", "깡", "Rain", 237);
        Music m10 = new Music(defaultPath + "TWICE - FANCY.mp3", "FANCY", "TWICE", 114);

		
        ArrayList<Music> musicList = new ArrayList<>();
        
        musicList.add(m1);
        musicList.add(m2);
        musicList.add(m3);
        musicList.add(m4);
        musicList.add(m5);
        musicList.add(m6);
        musicList.add(m7);
        musicList.add(m8);
        musicList.add(m9);
        musicList.add(m10);
        

//        System.out.println(musicList.get(0).getTitle());
        
        Scanner sc = new Scanner(System.in);
        
        // 현재 어떤노래가 재생중인지 저장되는 변수 index
        
        int index = 0;
        
        while(true) {
        	System.out.println();
        	System.out.print("[1]재생 [2]정지 [3]이전 곡 [4]다음 곡 [5] 종료 >>");
        	int select = sc.nextInt();
        	if(select == 1) {
        		//노래재생
        		
        		
        		
        		mp3.play(musicList.get(index).getPath());
        		//console
        		musicList.get(index).showMusic();
        		//노래 제목 - 가수이름, 4분 30초
        		
        		// 첫번째 노래가 재생될 수 있도록 만들기
        	}else if(select == 2) {
        		
        		con.musicStop();
        		
        	}else if(select == 3) {
        		
        		con.musicStop();
        		
        		index = con.preMusic(index, musicList);
        		musicList.get(index).showMusic();
        		
        		// 노래 이전곡
        		
        	}else if(select == 4) {
        		
        		con.musicStop();
        		index = con.nexMusic(index, musicList);
        		musicList.get(index).showMusic();
        		
        		// 노래 다음곡
        	}else if(select == 5) {
        		con.musicStop();
        		break;
        		// 정지
        	}
        	
        	
        	
        	
        	
        	
        	
        }
        
		
		
		
		
		
		
		
		
	}

}