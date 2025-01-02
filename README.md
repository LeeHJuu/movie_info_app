# Movie Info App
TMDB API를 사용하여 영화 정보를 조회하는 어플

## 📋 기능

- TMDB API를 사용하여 영화 목록 조회
- 현재 상영작 / 인기순 / 평점 높은순 / 개봉예정의 카테고리별 영화 목록 출력
- 포스터 이미지 눌러 영화의 상세 정보 확인


## 🛠️ 기술 스택

- **프레임워크**: Flutter
- **언어**: Dart
- **사용 기술**
  - Clean Architecture
  - Riverpod
 
## 📂 프로젝트 구조
```bash
📦lib
 ┣ 📂data
 ┃ ┣ 📂data_source
 ┃ ┃ ┣ 📜movie_data_source.dart
 ┃ ┃ ┗ 📜movie_data_source_impl.dart
 ┃ ┗ 📂dto
 ┃ ┃ ┣ 📜movie_detail_dto.dart
 ┃ ┃ ┗ 📜movie_response_dto.dart
 ┣ 📂domain
 ┃ ┣ 📂entity
 ┃ ┃ ┣ 📜movie.dart
 ┃ ┃ ┗ 📜movie_detail.dart
 ┃ ┣ 📂repository
 ┃ ┃ ┣ 📜movie_repository.dart
 ┃ ┃ ┗ 📜movie_repository_impl.dart
 ┃ ┗ 📂usecase
 ┃ ┃ ┣ 📜fetch_movie_detail_usecase.dart
 ┃ ┃ ┣ 📜fetch_now_playing_movies_usecase.dart
 ┃ ┃ ┣ 📜fetch_popular_movies_usecase.dart
 ┃ ┃ ┣ 📜fetch_top_rate_movies_usecase.dart
 ┃ ┃ ┗ 📜fetch_upcoming_movies_usecase.dart
 ┣ 📂ui
 ┃ ┣ 📂pages
 ┃ ┃ ┣ 📂detail
 ┃ ┃ ┃ ┣ 📜detail_page.dart
 ┃ ┃ ┃ ┗ 📜detail_view_model.dart
 ┃ ┃ ┗ 📂home
 ┃ ┃ ┃ ┣ 📜home_page.dart
 ┃ ┃ ┃ ┗ 📜home_view_model.dart
 ┃ ┗ 📜providers.dart
 ┣ 📜api.dart
 ┗ 📜main.dart
```

## 🚀 시작하기

이 어플을 실행하기 위해서는 Flutter와 Dart가 설치되어 있어야 합니다. [Flutter 설치 가이드](https://flutter.dev/docs/get-started/install)에서 필요한 환경 설정을 완료해주세요.

### 설치 및 실행

1. **저장소 클론**:
   ```bash
   git clone https://github.com/LeeHJuu/movie_info_app.git
   cd flutter_train_app
2.  **의존성 패키지 설치**:
    ```bash 
      flutter pub get
3.  **어플 실행**:
    ```bash 
      flutter run

