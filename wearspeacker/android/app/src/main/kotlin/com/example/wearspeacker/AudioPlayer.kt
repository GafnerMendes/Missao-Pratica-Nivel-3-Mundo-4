package com.example.wearspeacker


import android.content.Context
import android.media.MediaPlayer

class AudioPlayer(private val context: Context) {

    private var mediaPlayer: MediaPlayer? = null

    fun playAudio(audioResId: Int) {
        mediaPlayer = MediaPlayer.create(context, audioResId)
        mediaPlayer?.start()
    }

    fun stopAudio() {
        mediaPlayer?.release()
        mediaPlayer = null
    }
}
