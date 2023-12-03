import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final O3DController o3dController = O3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Titus 3D"),
      ),
      body: Stack(
        children: [
          O3D(
            controller: o3dController,
            cameraControls: false,
            src: 'https://models.readyplayer.me/656c8139fd16ab329ca47797.glb',
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildFloatingActionButton(Icons.zoom_in, () {
                  o3dController.cameraOrbit(0, 75, 70);
                  o3dController.cameraTarget(0, 0.95, -2.2);
                }),
                const SizedBox(height: 10,),
                _buildNavigationButtons(),
                const SizedBox(height: 15,),
                _buildFloatingActionButton(Icons.threed_rotation, () {
                  o3dController.cameraControls = true;
                }),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(IconData icon, VoidCallback onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFloatingActionButton(Icons.swipe_left_alt_rounded, () {
          o3dController.cameraOrbit(90, 75, 70);
          o3dController.cameraTarget(1, 1, 0);
        }),
        _buildFloatingActionButton(Icons.center_focus_strong_outlined, () {
          o3dController.cameraOrbit(0, 75, 70);
          o3dController.cameraTarget(0, 0.87, 0);
        }),
        
        _buildFloatingActionButton(Icons.swipe_right_alt_rounded, () {
          o3dController.cameraOrbit(-90, 75, 70);
          o3dController.cameraTarget(-1, 1, 0);
        }),
      ],
    );
  }
}
