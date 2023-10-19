import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { environment } from './environments/environment';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: environment.allow_frontend,
  });
  app.setGlobalPrefix('api');
  await app.listen(9000);
}
bootstrap();
