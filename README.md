# HydroDaily (iOS)

Versión para iPhone de HydroDaily, hecha con Flutter.
Calcula cuánta agua necesitas al día según tu peso, sexo y actividad, registra lo que bebes con un toque, lleva
la racha de días cumpliendo el objetivo y recibe recordatorios configurables. Premium quita los anuncios.

- Bundle ID: `com.oeaon.hydrodaily`
- iOS 15 o superior
- Idiomas: español, inglés, árabe, alemán, francés, hindi, italiano, portugués, ruso y chino
- Anuncios con AdMob (consentimiento con UMP) y Premium con compras de Apple:
  `com.oeaon.hydrodaily.premium_monthly` (suscripción mensual, 1,99 €) y `com.oeaon.hydrodaily.premium_lifetime` (compra no consumible, 9,99 €)

## Desarrollo

```bash
flutter pub get
flutter test
flutter run
```

Sin `--dart-define` se usan los anuncios de prueba de Google. La carpeta `android/` solo sirve para probar en un
emulador desde Windows; la app se publica en el App Store.

## Publicar con Codemagic

1. **App Store Connect**: crea la app con el bundle ID `com.oeaon.hydrodaily` y los dos productos de compra.
2. **Clave API**: en App Store Connect → Usuarios y acceso → Integraciones → Claves de API del equipo, crea una
   clave con rol *App Manager*. En Codemagic → Ajustes del equipo → Integraciones → App Store Connect, añádela con
   el nombre `OEAON` (sube el `.p8`, el Issuer ID y el Key ID).
3. **Variables**: en la app de Codemagic → Environment variables, grupo `admob`:
   `ADMOB_APP_ID`, `AD_BANNER`, `AD_INTERSTITIAL`, `AD_APP_OPEN`, `AD_REWARDED` y `APP_STORE_APPLE_ID`.
4. **Compilar**: lanza el workflow `ios-release` o crea una etiqueta `v1.0.0`. La build se sube a TestFlight y
   desde ahí se envía a revisión en App Store Connect.
