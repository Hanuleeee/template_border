# 20180709_Day20



### 복습

* 비동기 자바스크립트 : ajax

* 좋아요를 눌렀을때 특정 url로 요청을 보냄 그 url을 routes 파일에다가 구현을 해놓는다.

  404 error가 뜨게되고, controller에 가서 구현하기

  controller 메소드랑 이름이 동일한 js.erb 파일을 만들어서 동작가능하도록 한다. (자바스크립트 파일이랑 데이터랑 합쳐서 함?  응답자체를 자바스크립트로 보냄 -> 크롤링하기 어려운 사이트가 된다.)

* 댓글 부분은 자바스크립트를(작동하는 코드를) 다 짜놓고 ajax를 구현해라?(어떻게 변화하는지에 대한 코드는 나중에. 왜? 일단 눈에 보이는 부분을 구현하고.. 데이터넘어가는거는 나중에)

* *movies.controllers*

  `setInterval(function())`  # 몇초에 한번씩 동작해라 -> 서버의 과부하를 줄이기 위해서





## HTML Template on Rails



- 프로젝트를 구성할 때 디자인은 굉장히 많은 부분을 차지한다. 아무리 뛰어나고 코어한 기능을 가졌다고 하더라도 디자인이 만족스럽지 못하면 사용자가 이용하지 않을 가능성이 크다. 오히려 기능이 부족하더라도 디자인이 아름다운 것이 사용자의 사용성을 이끌어내기에 더 적합한 것 같다. 물론 디자인과 기능 모두 갖추는게 가장 적절하지만 말이다.
- 그래서 우리는 직접 디자인을 하지 않고 디자인된 HTML 템플릿을 적용해 웹디자이너와 퍼블리셔가 만든 듯한 사이트를 만들어보자.
- 디자인 템플릿은 [이곳](https://elements.envato.com/web-templates)에서 월별 결제한 후 진행했다.
- 다음과 같은 순서에 의해 진행한다. (다음 문서는 [Fuzen](https://elements.envato.com/fuzen-bootstrap-4-admin-template-ui-kit-P9BXE2)을 기준으로 작성되었다.)



#### **1. 먼저 해당 Template 에 사용된 Boostrap 버전을 확인한다. 최근 3버전에서 4버전으로 업데이트됐기 때문에 버전에 맞춰 진행하는 것이 중요하다. 해당 버전에 맞춰서 Gem을 설치한다.**



```bash
$ rails g controller home index
```



*Gemfile*

```ruby
#bootstrap 4
gem 'bootstrap', '~> 4.1.1'  # -> bootstrap4 버전
# gem 'bootstrap-sass'      # -> bootstrap3버전

#font-awesome
gem 'font-awesome-rails'

# gem 'turbolinks', '~> 5'  # 터보링크 주석처리
```

*config/routes.rb*

```ruby
 root 'home#index'   #root로 사용
```



#### **2. 설치된 Gem들을 사용할 수 있게 설정한다. 나머지 설정도 해준다.** 

```bash
$bundle install
```



*assets/javascripts/application.js*

```js
//= require jquery
//= require jquery_ujs    
//= require popper         # 추가
//= require bootstrap	   # 추가
```



#### **3. 우리가 사용할 템플릿 파일에서 사용하고 있는 stylesheet파일들을 확인하고 *vendor/assets/stylesheet*에 Copy&Paste한다.**

> vendor 폴더를 사용하는 이유는 여기에 들어가는 css와 js는 거의 변화가 없는 library정도에 해당하는 파일이 들어간다. 변화할 파일들(custom.css/ style.css)은 *app/assets/stylesheet* 에 넣어둔다.

*fuzen\placeholder 의 dashboard.html* **atom** 으로 연다.

*

```javascript
    <!-- Vendor: Bootstrap 4 Stylesheets  -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<!-- Our Website CSS Styles -->
    <link rel="stylesheet" href="css/icons.min.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">
    <link rel="stylesheet" href="css/responsive.css" type="text/css">

    <!-- Color Scheme -->
    <link rel="stylesheet" href="css/color-schemes/color.css" type="text/css" title="color3">
    <link rel="alternate stylesheet" href="css/color-schemes/color1.css" title="color1">
    <link rel="alternate stylesheet" href="css/color-schemes/color2.css" title="color2">
    <link rel="alternate stylesheet" href="css/color-schemes/color4.css" title="color4">
    <link rel="alternate stylesheet" href="css/color-schemes/color5.css" title="color5">
```

- 이중에서 Gem으로 설치한 파일은 제외한다(bootstrap)

  

* `fuzen\placeholder\css` 에서 내 template가 가진 `css` 파일들을 찾아서 *vendor/assets/stylesheets* 에 드래그앤 드롭(Copy&Paste) 한다. (`Color Scheme` 는 폴더 전체를 가져왔다.)

  

#### ***4. app/assets/stylesheet/application.css* -> scss 확장자를 바꾸고 우리가 vendor에 넣어둔 파일들을 전부 `@import` 한다.  기존에 있던 *= 형태로 되어있는 import는 전부 제거한다.**

*app/assets/stylesheet/application.scss*

```scss
@import 'bootstrap';
@import 'font-awesome'; // font-awesome-rails 설치시에만
```

*app/assets/stylesheet/home.scss*

```scss
@import 'icons.min';
@import 'main';
@import 'responsive';
@import 'color-schemes/color';
@import 'color-schemes/color1';
@import 'color-schemes/color2';
@import 'color-schemes/color4';
@import 'color-schemes/color5';
```

- css `.css` 앞부분까지만 `ctl`누르고 다 복사해와서  *assets/stylesheets/home.scss* 로 붙여넣기를 한다.
- 공통되는 css 파일은 *application.scss* 파일이 넣어는 것이 좋고 각 컨트롤러마다 사용하는 css파일은 컨트롤러별로 만들어진 scss 파일어 넣어주는 것이 좋다.



*views/layouts/application.html.erb*

```erb
<!DOCTYPE html>
<html>
  <head>
    <title>TemplateApp</title>
    <%= csrf_meta_tags %>
    <meta name="viewport" content="width=device-width, initial-scale=1">   <!-- 추가 -->

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= stylesheet_link_tag     params[:controller], media: 'all' %>  <!-- 추가 -->
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```



#### **5. 동일한 형태로 js도 진행한다.(파일 복사) 새로운 컨트롤러가 만들어 질 때 coffee 스크립트가 적용되는데 이 확장자도 js로 바꿔준다. `//=require-tree`는 삭제하고 *application.js*에서는 bootstrap과 jquery 혹은 모든 페이지에서 공통되는 js만 import한다.**

*fuzen/dashboard.html*

```javascript
	<!-- Vendor: Javascripts -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <!-- Vendor: Followed by our custom Javascripts -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/select2.min.js" type="text/javascript"></script>
    <script src="js/slick.min.js" type="text/javascript"></script>

    <!-- Our Website Javascripts -->
    <script src="js/isotope.min.js" type="text/javascript"></script>
    <script src="js/isotope-int.js" type="text/javascript"></script>
    <script src="js/jquery.counterup.js" type="text/javascript"></script>
    <script src="js/waypoints.min.js" type="text/javascript"></script>
    <script src="js/highcharts.js" type="text/javascript"></script>
    <script src="js/exporting.js" type="text/javascript"></script>
    <script src="js/highcharts-more.js" type="text/javascript"></script>
    <script src="js/moment.min.js" type="text/javascript"></script>
    <script src="js/jquery.circliful.min.js" type="text/javascript"></script>
    <script src="js/fullcalendar.min.js" type="text/javascript"></script>
    <script src="js/jquery.downCount.js" type="text/javascript"></script>
    <script src="js/jquery.bootstrap-touchspin.min.js" type="text/javascript"></script>
    <script src="js/jquery.formtowizard.js" type="text/javascript"></script>
    <script src="js/form-validator.min.js" type="text/javascript"></script>
    <script src="js/form-validator-lang-en.min.js" type="text/javascript"></script>
    <script src="js/cropbox-min.js" type="text/javascript"></script>
    <script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="js/ion.rangeSlider.min.js" type="text/javascript"></script>
    <script src="js/jquery.poptrox.min.js" type="text/javascript"></script>
    <script src="js/styleswitcher.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
```

- jquery와 bootstrap은 제외한다.



assets/javascripts/home.js

```ruby
//= require select2.min
//= require slick.min
//= require isotope.min
//= require isotope-int
//= require jquery.counterup
//= require waypoints.min
//= require highcharts
//= require exporting
//= require highcharts-more
//= require moment.min
//= require jquery.circliful.min
//= require fullcalendar.min
//= require jquery.downCount
//= require jquery.bootstrap-touchspin.min
//= require jquery.formtowizard
//= require form-validator.min
//= require form-validator-lang-en.min
//= require cropbox-min
//= require jquery.slimscroll.min
//= require ion.rangeSlider.min
//= require jquery.poptrox.min
//= require styleswitcher
//= require main
```

- 마찬가지로 *application.js* 에는 공통적으로 사용하는 js파일을, 각 컨트롤러별로 활용할 파일은 각 *컨트롤러.js* 파일에서 `require` 한다.

  

- *vendor/javascripts* 에 `fuzen\placeholder\js` 파일들 전부 **Copy&Paste**해서 가져온다.

  (단, `bootstrap.min.js` , `jquery.min.js`제외)

  

  

#### ***6. config/initializers/assets.rb* 에서 `Rails.application.config.assets.precompile` 부분 주석처리를 해제하고 우리가 사용할 컨트롤러에 해당하는 js와 scss 파일명을 나열한다. 여기에 추가된 친구들은 precompile된다.**

*config/initializers/assets.rb*

```
# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( home.js
                                                  home.scss)
```

- 앞으로 추가될 js, scss파일도 이곳에 반드시 추가해야한다.

  

#### **7. `rake assets:precompile`  을 실행해서 scss 파일과 js 파일에 이상이 없는지 확인한다.  이상이 있는 부분은 css, js에 맞춰서 수정한다.**



```bash
$ rake assets:precompile  # precompile시키면서 에러부분을 찾아서 계속 수정한다.
# 캐싱 = 이름을 유일하게 만들어줘서 한번 캐시라는 저장소에 저장하면 reload할때마다 캐싱되어있는 자바스크립트 파일을 가져옴. 그래서 페이지 변환을 빨리해줄 수 있다.
# 캐싱은 front , backand에서 다 중요하다.

$ rake assets:clobber  # drop같은거?
```

* 해당 코드는 *public/assets*에 프리컴파일 된 css, js파일을 만들어낸다. 해당 파일들은 브라우저에 캐싱되며 우리의 페이지 로드를 더 빠르게 만들 것이다. 만약 이상이 있어 수정할 경우, 다음의 명령어를 통해 삭제한 후 재실행한다.



#### **8. 이제 실제 body에 해당하는 부분을 우리 page로 가져오면 되는데, 기본적으로 `nav`, `footer` 은 파일을 분리하는 것이 좋다. 반복적으로 사용될 친구들인데 이 친구들은 `render(patial)`을 이용해서 view를 분리하는게 좋다. 그래서 필요한 부분에 가져다 사용하면 된다.**

*app/views/layout/application.html.erb*

```
<!DOCTYPE html>
<html>
  <head>
    <title>Fuzen</title>
    <%= csrf_meta_tags %>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%= stylesheet_link_tag    'application', media: 'all' %>
    <%= javascript_include_tag 'application' %>
  </head>

  <body class="panel-data expand-data">
    <%= render 'shared/topbar' %>
    <%= render 'shared/sidebar' %>
    <%= render 'shared/option_panel' %>
    <%= yield %>
    <%= render 'shared/footer' %>
  </body>
</html>
```

- 더 세세하게 구분하면 위와같이 구성할 수 있다.

  

#### **9. 실제로 우리가 만든 view에는 우리 서비스가 제공되는 페이지이자, 로직이 들어간다.**

*app/views/home/index.html.erb*

```erb
<div class="pg-tp">
  <i class="ion-cube"></i>
  <div class="pr-tp-inr">
    <h4>Welcome to
      <strong>FUZEN</strong>
      <span></span>
      Panel</h4>
    <span>Admin Template for medium and large web applications with ery clean and aesthetic style.</span>
  </div>
</div>
<!-- Page Top -->
...
```



#### **10. js의 경우에는 대부분 문서 제일 마지막에 들어가는데 이부분을 해결하기 위해서 `yield 'content_name'`과 `content_for 'content_name'` 과 같은 전략을 사용한다.** 

    페이지가 끝날때 우리가 만든 js로직이 제일 하단에 들어간다.

- 그 이전에 *application.scss*나 *application.js*이외에 컨트롤러 별로 다른 scss를 활용하기 위해서 다음과 같은 코드를 추가한다.

*app/views/layout/applicaion.html.erb*

```erb
<!DOCTYPE html>
<html>
  <head>
    <title>Fuzen</title>
    <%= csrf_meta_tags %>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%= stylesheet_link_tag    'application', media: 'all' %>
      
    <%= stylesheet_link_tag    params[:controller], media: 'all' %> 
      
    <%= javascript_include_tag 'application' %>
  </head>
  ... 
</html>
```

*app/views/layout/applicaion.html.erb*

```erb
...
  <body class="panel-data expand-data">
    <%= render 'shared/topbar' %>
    <%= render 'shared/sidebar' %>
    <%= render 'shared/option_panel' %>
    <%= yield %>
    <%= render 'shared/footer' %>
    <%= yield 'javascript_contents' %>
  </body>
...
```

- 위의 `yield 'javascript_contents'` 코드를 만나면 해당코드는 `content_for 'javascript_contents'`에 해당하는 블록을 위의 위치에 포함하게 된다.





#### **11. 우리가 1~5번까지 작성했던 js파일과 scss 파일을 실제 뷰에서 사용하기 위해서 `stylesheet_link_tag`와 `javascript_include_tag`에 각 컨트롤러에 맞는 파일을 가져오기 위해서 `params[:controller]` 라는 매개변수를 주어 각 컨트롤러마다 다른 scss와 js가 적용되도록 한다.**

*app/views/home/index.html.erb*

```erb
<% content_for 'javascript_contents' do %>
<%= javascript_include_tag params[:controller] %>
<script type="text/javascript">
$(document).ready(function () {
    ...
})
</script>
<% end %>
```

- 위의 블록이 *application.html.erb*에 포함되게 된다.

  

#### 10. 이미지와 폰트의 경로를 지정해준다.

- 기본적으로 rails에서 이미지를 사용할 때 서버에 있는 이미지를 사용하기 위한 방법이 두가지 있다. 첫번째는 public 폴더에 모두 넣어두는 것이고 두번째는 *app/assets/images* 경로에 넣고 precompile된 이미지를 사용하는 것이다. 그래서 반드시 이미지를 사용할 때에는 `<%= asset_path '이미지 경로' %>`의 형태로 사용해야 한다.

```erb
<img class="brd-rd5" src="<%= asset_path 'resource/prd-img1.jpg' %>" alt=""/>
```

- css 파일에서 이미지를 포함하는 경우도 있다. 해당 경우에는 다음과 같이 작성해야한다.

```
.class-name {
    background-image: url(asset-path('image-path.png'));
}
```

- 폰트의 경우에는 원래 다음과 같은 형태로 되어있다.

```
@font-face{
    font-family:"Ionicons";
    src:url("../fonts/ionicons.eot?v=2.0.1");
    src:url("../fonts/ionicons.eot?v=2.0.1#iefix") format("embedded-opentype"),
        url("../fonts/ionicons.ttf?v=2.0.1") format("truetype"),
        url("../fonts/ionicons.woff?v=2.0.1") format("woff"),
        url("../fonts/ionicons.svg?v=2.0.1#Ionicons") format("svg");
    font-weight:normal;font-style:normal}
```

- 위의 코드를 다음과 같이 고쳐준다.

    

*vendor/assets/stylesheets/icons.min.css*

```css
...
*/@font-face{font-family:"Ionicons";
src:font-url("ionicons.eot?v=2.0.1");
src:font-url("ionicons.eot?v=2.0.1#iefix") format("embedded-opentype"),
font-url("ionicons.ttf?v=2.0.1") format("truetype"),
font-url("ionicons.woff?v=2.0.1") format("woff"),
font-url("ionicons.svg?v=2.0.1#Ionicons") format("svg");
    font-weight:normal;font-style:normal} ...              /* 수정하기 */

*/@font-face{font-family:'FontAwesome' ...  /* fontawesome부분 지우기 */
```

- 그리고 *public/fonts* 폴더에 해당 폰트 파일들을 넣어주면 정상적으로 작동한다.

  (`fuzen\placeholder\fonts`에서 `fontawesome` 파일들 빼고 모두 *fonts* 폴더로 가져온다. )





이 모든 것을 **asset_pipeline** 이라고 하는데, 이는 페이지를 더 빠르게 로드하기 위한 전략으로 사용된다.       (  [공식문서 참조](http://guides.rubyonrails.org/asset_pipeline.html) )

#### 
