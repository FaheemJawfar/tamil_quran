import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_texts/quran_audio_texts.dart';
import '../providers/quran_provider.dart';
import '../common_widgets/loading_indicator.dart';
import '../app_config/color_config.dart';
import '../utils/check_connection.dart';
import '../read_quran/quran_helper.dart';
import '../common_widgets/show_toast.dart';
import '../read_quran/sura_details.dart';
import '../home/home_popup_menu.dart';
import '../utils/image_uri.dart';
import 'audio_player_helper.dart';
import 'reciter_selector_popup.dart';

class QuranAudioPlayerScreen extends StatefulWidget {
  const QuranAudioPlayerScreen({super.key});

  @override
  State<QuranAudioPlayerScreen> createState() => _QuranAudioPlayerScreenState();
}

class _QuranAudioPlayerScreenState extends State<QuranAudioPlayerScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  int selectedSuraIndex = 0;

  late AudioPlayer audioPlayer = QuranAudioPlayerHelper.audioPlayer;
  bool isLoading = false;
  bool suraPlayed = false;
  Duration duration = const Duration();
  Duration position = const Duration();
  String currentUrl = '';

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  void initAudioPlayer() {
    try {
      audioPlayer.durationStream.listen((updatedDuration) {
        if (!mounted) return;
        setState(() {
          duration = updatedDuration ?? Duration.zero;
        });
      });

      audioPlayer.positionStream.listen((updatedPosition) {
        if (!mounted) return;
        setState(() {
          position = updatedPosition;
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> playAudio() async {
    try {
      setState(() {
        isLoading = true;
        suraPlayed = true;
      });

      String newUrl = QuranHelper.getAudioURLBySurah(
        quranProvider.selectedReciterDetails,
        selectedSuraIndex + 1,
      );

      if (currentUrl != newUrl) {
        await audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.parse(newUrl),
            tag: MediaItem(
              id: selectedSuraIndex.toString(),
              album: quranProvider.selectedReciterDetails.name,
              title: SuraDetails.suraListAll[selectedSuraIndex].tamilName,
              artUri: await ImageUriParser.getImageFileFromAssets(
                  'assets/icon/quran_icon.png'),
            ),
          ),
        );
        currentUrl = newUrl;
        position = Duration.zero;
      }

      audioPlayer.play();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
      bool hasInternet = await checkInternetConnection();
      if (!hasInternet) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void pauseAudio() {
    audioPlayer.pause();
    setState(() {});
  }

  void seekAudio(Duration duration) {
    audioPlayer.seek(duration);
  }

  void playNext() {
    if (selectedSuraIndex < SuraDetails.suraListAll.length - 1) {
      setState(() {
        selectedSuraIndex++;
      });
      playAudio();
    }
  }

  void playPrevious() {
    if (selectedSuraIndex > 0) {
      setState(() {
        selectedSuraIndex--;
      });
      playAudio();
    }
  }

  Future<bool> checkInternetConnection() async {
    bool connected = await CheckConnection.checkInternetConnection();
    if (!connected) {
      if (mounted) {
        ShowToast.showToast(context, QuranAudioTexts.checkInternetConnection);
      }
      return false;
    }
    return true;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return "$hours:${twoDigits(minutes)}:${twoDigits(seconds)}";
    }
    return "${twoDigits(minutes)}:${twoDigits(seconds)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quranProvider.isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFE8F5EE), // More distinct light green background
      appBar: AppBar(
        title: Text(
          quranProvider.selectedReciterDetails.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReciterSelectorPopup(
                      reciters: quranProvider.allReciters,
                      selectedReciter:
                          quranProvider.selectedReciterDetails.identifier,
                      onSelected: (value) {
                        quranProvider.selectedReciter = value;
                      },
                    );
                  },
                );
              },
              icon: const Icon(LucideIcons.userPlus)),
          const HomeScreenPopupMenu(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: SuraDetails.suraListAll.length,
              itemBuilder: (context, index) {
                final isSelected = selectedSuraIndex == index;
                final sura = SuraDetails.suraListAll[index];

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorConfig.primaryColor.withAlpha(25)
                        : quranProvider.isDarkMode
                            ? Colors.black26
                            : ColorConfig.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? ColorConfig.primaryColor
                          : Colors.transparent,
                      width: 1,
                    ),
                    boxShadow: [
                      if (!isSelected)
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorConfig.primaryColor
                            : ColorConfig.primaryColor.withAlpha(30),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : ColorConfig.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      sura.tamilName,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w600,
                        fontSize: 16,
                        color: isSelected
                            ? ColorConfig.primaryColor
                            : quranProvider.isDarkMode
                                ? Colors.white
                                : Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      '${sura.tamilMeaning ?? ""} • ${sura.verseCount} Verses',
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? ColorConfig.primaryColor
                            : quranProvider.isDarkMode
                                ? Colors.white70
                                : Colors.black54,
                      ),
                    ),
                    trailing: isSelected && audioPlayer.playing
                        ? const Icon(LucideIcons.volume2,
                            color: ColorConfig.primaryColor)
                        : Icon(
                            LucideIcons.circlePlay,
                            color: isSelected
                                ? ColorConfig.primaryColor
                                : Colors.grey.withAlpha(100),
                            size: 20,
                          ),
                    onTap: () {
                      setState(() {
                        selectedSuraIndex = index;
                      });
                      playAudio();
                    },
                  ),
                );
              },
            ),
          ),
          _buildPlayerControlPanel(),
        ],
      ),
    );
  }

  Widget _buildPlayerControlPanel() {
    final sura = SuraDetails.suraListAll[selectedSuraIndex];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
      decoration: BoxDecoration(
        color: quranProvider.isDarkMode
            ? const Color(0xFF1E1E1E)
            : ColorConfig.popupColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Current Surah Info
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorConfig.primaryColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(LucideIcons.music,
                    color: ColorConfig.primaryColor, size: 24),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sura.tamilName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ColorConfig.primaryColor,
                      ),
                    ),
                    Text(
                      quranProvider.selectedReciterDetails.name,
                      style: TextStyle(
                        fontSize: 13,
                        color: quranProvider.isDarkMode
                            ? Colors.white70
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Progress Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              activeTrackColor: ColorConfig.primaryColor,
              inactiveTrackColor: ColorConfig.primaryColor.withAlpha(50),
              thumbColor: ColorConfig.primaryColor,
              overlayColor: ColorConfig.primaryColor.withAlpha(30),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            ),
            child: Slider(
              value: suraPlayed ? position.inSeconds.toDouble() : 0,
              min: 0.0,
              max: suraPlayed ? duration.inSeconds.toDouble() : 1.0,
              onChanged: (double value) {
                if (suraPlayed) {
                  seekAudio(Duration(seconds: value.toInt()));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(position),
                  style: TextStyle(
                      fontSize: 14,
                      color: quranProvider.isDarkMode
                          ? Colors.white70
                          : Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  formatDuration(duration),
                  style: TextStyle(
                      fontSize: 14,
                      color: quranProvider.isDarkMode
                          ? Colors.white70
                          : Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(LucideIcons.skipBack, size: 30),
                onPressed: playPrevious,
                color: ColorConfig.primaryColor,
              ),
              GestureDetector(
                onTap: () {
                  if (audioPlayer.playing) {
                    pauseAudio();
                  } else {
                    playAudio();
                  }
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: ColorConfig.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConfig.primaryColor.withAlpha(80),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: LoadingIndicator(color: Colors.white),
                          )
                        : Icon(
                            audioPlayer.playing
                                ? LucideIcons.pause
                                : LucideIcons.play,
                            size: 32,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.skipForward, size: 30),
                onPressed: playNext,
                color: ColorConfig.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
