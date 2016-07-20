package com.zlwh.hands.api.common.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * FFmpeg官方介绍：https://ffmpeg.org/
 * 
 * @author yuanjifeng
 */

public class FFmpegUtils {

	public static final String FFMPEG_PATH = "E:/ffmpeg-20160531-git-a1953d4-win32-static/bin/ffmpeg.exe";
	
	/**
	 * 
	 * 创建视频缩略图
	 * 
	 */
	public static boolean createVideoThumbnail(String inputPath, String outputPath){
		File file = new File(FFMPEG_PATH);
		if (!file.exists()) {
			System.err.println("路径[" + FFMPEG_PATH + "]对应的ffmpeg.exe不存在!");
			return false;
		}
		List<String> commands = new ArrayList<String>();
		commands.add(FFMPEG_PATH);
		commands.add("-i");
		commands.add(inputPath);
		commands.add("-r");
		commands.add("1");
		commands.add("-ss");
		commands.add("1");
		commands.add("-vframes");
		commands.add("1");
		commands.add("-f");
		commands.add("image2");
		commands.add(outputPath);
		try {
			ProcessBuilder processBuilder = new ProcessBuilder();
			processBuilder.command(commands);
			processBuilder.start();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args) throws IOException {
		System.out.println(createVideoThumbnail("F://ffmpeg-20160531-git-a1953d4-win32-static/1.mp4","D://1_sub.jpeg"));
	}
}
