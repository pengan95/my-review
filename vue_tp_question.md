## TP和Vue.js的问题

后台工具并不依赖于SEO
基于Vue开发的单页前后端分离项目

每个请求对应的api token 防止csrf攻击

`<meta name="csrf-token" content="{{ csrf_token() }}">`
`window.Laravel = <?php echo json_encode(['csrfToken' => csrf_token()]); ?>`