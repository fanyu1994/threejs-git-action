<template>
  <h1>{{ msg }}</h1>
  <div class="card"></div>
</template>

<script setup lang="ts">
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import { onMounted, defineProps } from 'vue'

interface Props {
  msg: string
}

withDefaults(defineProps<Props>(), {
  msg: '标题未设置',
})

const width = window.innerWidth
const height = 800
onMounted(() => {
  // 创建场景、相机和渲染器
  var scene = new THREE.Scene()
  var camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000)
  var renderer = new THREE.WebGLRenderer()

  renderer.setSize(width, height)
  document.querySelector('.card')!.appendChild(renderer.domElement)

  // 创建一个球体，并将全景图片作为纹理贴上去
  var geometry = new THREE.SphereGeometry(500, 60, 40)
  geometry.scale(-1, 1, 1)
  var texture = new THREE.TextureLoader().load('src/assets/bg2.jpg')
  var material = new THREE.MeshBasicMaterial({ map: texture })
  var sphere = new THREE.Mesh(geometry, material)
  scene.add(sphere)

  // 添加OrbitControls控制器
  var controls = new OrbitControls(camera, renderer.domElement)
  controls.autoRotate = true // 设置控制器自动旋转
  controls.enableDamping = true // 启用阻尼效果
  controls.dampingFactor = 0.1 // 阻尼系数，越小阻尼越强1
  controls.rotateSpeed = 0.5 // 旋转速度

  // 设置相机位置
  camera.position.set(0, 0, 1)
  camera.lookAt(sphere.position)

  function animate() {
    requestAnimationFrame(animate)
    controls.update() // 更新控制器
    renderer.render(scene, camera)
  }
  animate()
})
</script>

<style>
.card {
  width: 100%;
  height: 400px;
}
</style>
