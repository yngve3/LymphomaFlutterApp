abstract class AppStrings {
  static const appName = "About lymphoma";
  static const startPageAboutApp = "Весь ход лечения в вашем телефоне: "
      "cледите за лечением, записями к врачам "
      "и получайте рекомендации по анализам.";

  static const register = "Зарегистрироваться";
  static const registration = "Регистрация";
  static const login = "Войти";
  static const logon = "Вход";
  static const alreadyHaveAccount = "Уже есть аккаунт?";

  static const enterEmail = "Введите почту";
  static const enterPassword = "Введите пароль";
  static const repeatPassword = "Повторите пароль";
  static const email = "Почта";
  static const password = "Пароль";

  static const forgotPassword = "Забыли пароль?";
  static const recovery = "Восстановление";

  static const recoveryHint = "Введите почту указанную при регистрации, "
      "на нее придет инструкция для восстановления пароля";

  static const recoverPassword = "Восстановить пароль";
  static const checkYourEmail = "Проверьте вашу почту";
  static const ifAccountExistBegin = "Если аккаунт";
  static const ifAccountExistEnd = "существует, вам придет письмо с инструкцией для восстановления пароля";
  static const toStartPage = "На главную";
  static const continueText = "Продолжить";

  static const fullName = "ФИО";
  static const enterFullName = "Введите Фамилию Имя Отчество";
  static const enterDate = "Введите дату";
  static const birthdate = "Дата рождения";
  static const phoneNumber = "Телефон";
  static const enterPhoneNumber = "Введите ваш номер телефона";
  static const familyPhoneNumber = "Телефон родственника";
  static const enterFamilyPhoneNumber = "Введите номер телефона близкого";
  static const sendRequest = "Отправить запрос";
  static const requestStatusTitle = "Запрос успешно\nотправлен врачу";
  static const requestStatusSubtitle = "Ответ придет в течение дня.\nО подтверждении аккауанта\nмы оповестим вас через почту.";
  static const didntGeEmail = "Не получили письмо? Проверьте раздел спам или попробуйте";
  static const rewriteEmail = "ввести другую почту";
  static const emailIncorrect = "Неверный формат";
  static const passwordIncorrect = "Неверный формат";
  static const fullNameIncorrect = "Неверный формат";
  static const phoneIncorrect = "Неверный формат";
  static const passwordsNotEqual = "Пароли не совпадают";
  static const emailNotConfirmed = "Почта не подтверждена";
  static const invalidLoginOrPassword = "Неправильные логин или пароль";
  static const unknownError = "Неизвестная ошибка";
  static const emailAlreadyExist = "Пользователь уже существует";
  static const profile = "Профиль";
  static const uploadImage = "Загрузить изображение";
  static const changeImage = "Изменить изображение";
  static const typeDoctor = "Направление";
  static const room = "Кабинет";
  static const phoneDoctor = "Телефон для связи";
  static const notifications = "Уведомления";
  static const newPatients = "Новые пользователи";
  static const therapist = "Лечащий врач";
  static const diagnosis = "Диагноз";
  static const hystDiagnosis = "Гистологический диагноз";
  static const treatment = "Назначенное лечение";
}

abstract class TabNames {
  static const records = "Записи";
  static const patients = "Пациенты";
  static const doctors = "Врачи";
}

abstract class ListTitles {
  static const onCurrentWeek = "На этой неделе";
  static const all = "Все";
  static const favorites = "Избранные";
  static const allList = "Весь список";
  static const registrationRequests = "Запросы на регистрацию";
}

abstract class LogicStrings {
  static const init = "init";
  static const ok = "ok";
}

abstract class TableNames {
  static const doctors = "doctors";
  static const patients = "patients";
}

abstract class TableFieldNames {
  static const id = "id";
  static const fullName = "full_name";
  static const birthdate = "dob";
  static const phone = "phone";
  static const familyPhone = "phone_2";
  static const imageURL = "image_url";
  static const doctorType = "type";
  static const doctorRoom = "room";
  static const patientIsVerified = "is_verified";
  static const diagnosis = "diagnosis";
  static const role = "user_role";
}

abstract class FieldNames {
  static const email = "email";
  static const password = "password";
  static const repeatedPassword = "repeatedPassword";
  static const fullName = "fullName";
  static const phoneNumber = "phoneNumber";
  static const familyPhoneNumber = "familyPhoneNumber";
  static const userRole = "userRole";

  static const therapist = "therapist";
  static const treatment = "treatment";
  static const diagnosis = "diagnosis";
  static const hystDiagnosis = "hystDiagnosis";
}

abstract class UserRoles {
  static const patient = "patient";
  static const doctor = "doctor";
}