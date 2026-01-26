# -----------------------------------------------------------------------------
# uso8-blog-03 (Spring Boot) — multi-stage build
# -----------------------------------------------------------------------------

FROM eclipse-temurin:11-jdk-alpine AS builder
WORKDIR /app

COPY gradlew ./
COPY gradle ./gradle
COPY build.gradle settings.gradle ./
RUN ./gradlew dependencies --no-daemon || true

COPY src ./src
RUN ./gradlew bootJar --no-daemon -x test

# -----------------------------------------------------------------------------
FROM eclipse-temurin:11-jre-alpine
WORKDIR /app

RUN adduser -D -u 1000 appuser
USER appuser

COPY --from=builder /app/build/libs/*.jar app.jar

ENV SPRING_PROFILES_ACTIVE=production
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
