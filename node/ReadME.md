# AppVeyor.yml

AppVeyor let's you keep `appveyor.yml` outside of the repo.

Enter rawl url to `appveyor.yml` into:

```
project -> settings -> general -> Custom configuration .yml file name
```

Reference:

https://www.appveyor.com/docs/build-configuration/#alternative-yaml-file-location


> It is possible to keep YAML file outside of repository. For that place YAML file as a plain text (Content-Type: text/plain) and anonymously accessible at some HTTP (or HTTPS) location. If using some web hosting, let file has .txt extension for it to get correct content type. However better option is to use permalink to GitHub gist raw file, and take advantage of keeping file change history on GitHub. After that place URL to YAML file to Custom configuration .yml file name setting. Needless to say that secure variables should be used for secrets in YAML file.