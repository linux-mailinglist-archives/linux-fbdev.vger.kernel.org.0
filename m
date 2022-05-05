Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C7451CA04
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 May 2022 22:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbiEEUMA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 May 2022 16:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbiEEUL7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 May 2022 16:11:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36BE5F247;
        Thu,  5 May 2022 13:08:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F323B82C4C;
        Thu,  5 May 2022 20:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6CCC385B7;
        Thu,  5 May 2022 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651781295;
        bh=2J3A2nVP5j1kW5YxuBOcohrcVqh9eJh7hKJ6qkG2IxE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pGVOA+nlWAv4zF+ej+HpjpYGvH6HjzHeDv3lOmq24s8T0eibj88c7+gk93eI+fRaF
         Kp3zzYaat/CbzzeB/V10tF09ZsR67AAUtR+0z9cOSKhBAXHUYoO7IQ5BYFKRFGUGr+
         YQSWOz0N05szaT98gHaOM7xggH2PBGVuuDKZrnw5XyGzmaBHK5ntiBZrWs5sgDoCf+
         VJ82aib+w3vhPWVcDQ3Cyz6DsJYkC0OKx/WsBcycpc0eIx3+jSu/t+3NgLso6VuUmc
         neUMO9CWLMcBBYqSO5qbFSr1ATtFaJSrsz3OV9cXjqosJAGpCw/0090GDMQMGxvE6x
         krOpMKF815ykQ==
Received: by mail-wm1-f46.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso5738750wmh.2;
        Thu, 05 May 2022 13:08:15 -0700 (PDT)
X-Gm-Message-State: AOAM532d7WSYD7ZC2iW9BXuXRVxpH+486Gmzo/JjBoj5Ob96aKFMRFy6
        VR3b4Yv8vC1J3thoNkErF0/kAa3eB6IjMRtST0Q=
X-Google-Smtp-Source: ABdhPJwwObn/UaqT30q1FbiaZHyI1hmOOl8iNniR0W2zAZ7y8tPUXLBWeVll6mQz87F2JUMC3yVO95QaB6biNASW3WU=
X-Received: by 2002:a05:600c:4144:b0:394:1972:1a73 with SMTP id
 h4-20020a05600c414400b0039419721a73mr27085wmm.71.1651781293834; Thu, 05 May
 2022 13:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
 <YnPhna5h1+kQGFLa@sirena.org.uk> <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
 <YnPna0pW9csiFkHK@sirena.org.uk>
In-Reply-To: <YnPna0pW9csiFkHK@sirena.org.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 5 May 2022 22:07:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1H-74Q1CzqW_Q=7g0KGkcd+TY3HTBbbE27XhXmfJhrRA@mail.gmail.com>
Message-ID: <CAK8P3a1H-74Q1CzqW_Q=7g0KGkcd+TY3HTBbbE27XhXmfJhrRA@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        IDE-ML <linux-ide@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-rtc@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, May 5, 2022 at 5:04 PM Mark Brown <broonie@kernel.org> wrote:
> On Thu, May 05, 2022 at 04:59:35PM +0200, Arnd Bergmann wrote:
> > On Thu, May 5, 2022 at 4:39 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> > > > On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > > > > static struct snd_soc_jack_pin hs_jack_pin[] = {
> > > > >         {
> > > > >                 .pin    = "Headphone Jack",
> > > > >                 .mask   = SND_JACK_HEADPHONE,
> > > > >         },
> > > > >         {
> > > > >                 .pin    = "Speaker",
> > > > >                 /* disable speaker when hp jack is inserted */
> > > > >                 .mask   = SND_JACK_HEADPHONE,
> > > > >                 .invert = 1,
> > > > >         },
>
> > > > Hm some ASoC thingie. No idea what that is, but I suppose another
> > > > place where a subsystem for legacy reasons try to do the gpiolib
> > > > inversion on it's own accord. That one isn't flagged as active low in the
> > > > descriptor so it's fine I guess.
>
> > > It's saying that when the headphone is inserted the headphone output
> > > should be enabled and the speaker output should be disabled, and vice
> > > versa.
>
> > Ok, that sounds like I should remove the flag here if I declare the
> > GPIO line as GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH, right?
>
> If you change the sense of the GPIO you'll need to flip the invert to
> the headphone instead of the speaker - whichever way round the GPIO
> sense is each of the pins should be taking the opposite sense from the
> GPIO state to the other.

Ok, I hope I got it this time:

- The hs_jack_gpio/"earphone-det" is declared as GPIO_ACTIVE_LOW,
    with the ".invert" dropped in the snd_soc_jack_gpio definition to match

- "spk-sd" is declared as GPIO_ACTIVE_LOW, so both
  this and  "hp-driver" are enabled by setting the gpio to active, rather than
  the two being opposites

- snd_soc_jack_pin flips the 'invert' flag from speaker to headphone, since
  the "earphone-det" is now  reversed

- hx4700_spk_power() flips polarity when setting the output to match the
  GPIO_ACTIVE_LOW setting, but hx4700_hp_power() does not change.

        Arnd

commit 20a9b05eff0488b78aa02c07f58654daa294069a
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Sep 11 14:27:13 2019 +0200

    ARM: pxa: hx4700: use gpio descriptors for audio

    The audio driver should not use a hardwired gpio number
    from the header. Change it to use a lookup table.

    Cc: Philipp Zabel <philipp.zabel@gmail.com>
    Cc: Paul Parsons <lost.distance@yahoo.com>
    Acked-by: Mark Brown <broonie@kernel.org>
    Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
    Cc: alsa-devel@alsa-project.org
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm/mach-pxa/hx4700-pcmcia.c
b/arch/arm/mach-pxa/hx4700-pcmcia.c
index e8acbfc9ef6c..e2331dfe427d 100644
--- a/arch/arm/mach-pxa/hx4700-pcmcia.c
+++ b/arch/arm/mach-pxa/hx4700-pcmcia.c
@@ -10,7 +10,7 @@
 #include <linux/irq.h>

 #include <asm/mach-types.h>
-#include <mach/hx4700.h>
+#include "hx4700.h"

 #include <pcmcia/soc_common.h>

diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 140a44cb2989..2ae06edf413c 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -41,7 +41,7 @@

 #include "pxa27x.h"
 #include "addr-map.h"
-#include <mach/hx4700.h>
+#include "hx4700.h"
 #include <linux/platform_data/irda-pxaficp.h>

 #include <sound/ak4641.h>
@@ -834,6 +834,19 @@ static struct i2c_board_info i2c_board_info[]
__initdata = {
        },
 };

+static struct gpiod_lookup_table hx4700_audio_gpio_table = {
+       .dev_id = "hx4700-audio",
+       .table = {
+               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
+                           "earphone-det", GPIO_ACTIVE_LOW),
+               GPIO_LOOKUP("gpio-pxa", GPIO92_HX4700_HP_DRIVER,
+                           "hp-driver", GPIO_ACTIVE_HIGH),
+               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
+                           "spk-sd", GPIO_ACTIVE_LOW),
+               { },
+       },
+};
+
 static struct platform_device audio = {
        .name   = "hx4700-audio",
        .id     = -1,
@@ -895,6 +908,7 @@ static void __init hx4700_init(void)

        gpiod_add_lookup_table(&bq24022_gpiod_table);
        gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
+       gpiod_add_lookup_table(&hx4700_audio_gpio_table);
        platform_add_devices(devices, ARRAY_SIZE(devices));
        pwm_add_table(hx4700_pwm_lookup, ARRAY_SIZE(hx4700_pwm_lookup));

diff --git a/arch/arm/mach-pxa/include/mach/hx4700.h
b/arch/arm/mach-pxa/hx4700.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/hx4700.h
rename to arch/arm/mach-pxa/hx4700.h
index 0c30e6d9c660..ce2db33989e1 100644
--- a/arch/arm/mach-pxa/include/mach/hx4700.h
+++ b/arch/arm/mach-pxa/hx4700.h
@@ -10,7 +10,7 @@

 #include <linux/gpio.h>
 #include <linux/mfd/asic3.h>
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */

 #define HX4700_ASIC3_GPIO_BASE PXA_NR_BUILTIN_GPIO
 #define HX4700_EGPIO_BASE      (HX4700_ASIC3_GPIO_BASE + ASIC3_NUM_GPIOS)
diff --git a/sound/soc/pxa/hx4700.c b/sound/soc/pxa/hx4700.c
index 7334fac758de..e6473c50e512 100644
--- a/sound/soc/pxa/hx4700.c
+++ b/sound/soc/pxa/hx4700.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>

 #include <sound/core.h>
 #include <sound/jack.h>
@@ -18,10 +18,10 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>

-#include <mach/hx4700.h>
 #include <asm/mach-types.h>
 #include "pxa2xx-i2s.h"

+static struct gpio_desc *gpiod_hp_driver, *gpiod_spk_sd;
 static struct snd_soc_jack hs_jack;

 /* Headphones jack detection DAPM pin */
@@ -29,20 +29,18 @@ static struct snd_soc_jack_pin hs_jack_pin[] = {
        {
                .pin    = "Headphone Jack",
                .mask   = SND_JACK_HEADPHONE,
+               .invert = 1,
        },
        {
                .pin    = "Speaker",
                /* disable speaker when hp jack is inserted */
                .mask   = SND_JACK_HEADPHONE,
-               .invert = 1,
        },
 };

 /* Headphones jack detection GPIO */
 static struct snd_soc_jack_gpio hs_jack_gpio = {
-       .gpio           = GPIO75_HX4700_EARPHONE_nDET,
-       .invert         = true,
-       .name           = "hp-gpio",
+       .name           = "earphone-det",
        .report         = SND_JACK_HEADPHONE,
        .debounce_time  = 200,
 };
@@ -81,14 +79,14 @@ static const struct snd_soc_ops hx4700_ops = {
 static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
                            struct snd_kcontrol *k, int event)
 {
-       gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
+       gpiod_set_value(gpiod_spk_sd, !SND_SOC_DAPM_EVENT_ON(event));
        return 0;
 }

 static int hx4700_hp_power(struct snd_soc_dapm_widget *w,
                           struct snd_kcontrol *k, int event)
 {
-       gpio_set_value(GPIO92_HX4700_HP_DRIVER, !!SND_SOC_DAPM_EVENT_ON(event));
+       gpiod_set_value(gpiod_hp_driver, !!SND_SOC_DAPM_EVENT_ON(event));
        return 0;
 }

@@ -162,11 +160,6 @@ static struct snd_soc_card snd_soc_card_hx4700 = {
        .fully_routed           = true,
 };

-static struct gpio hx4700_audio_gpios[] = {
-       { GPIO107_HX4700_SPK_nSD, GPIOF_OUT_INIT_HIGH, "SPK_POWER" },
-       { GPIO92_HX4700_HP_DRIVER, GPIOF_OUT_INIT_LOW, "EP_POWER" },
-};
-
 static int hx4700_audio_probe(struct platform_device *pdev)
 {
        int ret;
@@ -174,26 +167,26 @@ static int hx4700_audio_probe(struct
platform_device *pdev)
        if (!machine_is_h4700())
                return -ENODEV;

-       ret = gpio_request_array(hx4700_audio_gpios,
-                               ARRAY_SIZE(hx4700_audio_gpios));
+       gpiod_hp_driver = devm_gpiod_get(&pdev->dev, "hp-driver", GPIOD_ASIS);
+       ret = PTR_ERR_OR_ZERO(gpiod_hp_driver);
+       if (ret)
+               return ret;
+       gpiod_spk_sd = devm_gpiod_get(&pdev->dev, "spk-sd", GPIOD_ASIS);
+       ret = PTR_ERR_OR_ZERO(gpiod_spk_sd);
        if (ret)
                return ret;

+       hs_jack_gpio.gpiod_dev = &pdev->dev;
        snd_soc_card_hx4700.dev = &pdev->dev;
        ret = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_hx4700);
-       if (ret)
-               gpio_free_array(hx4700_audio_gpios,
-                               ARRAY_SIZE(hx4700_audio_gpios));

        return ret;
 }

 static int hx4700_audio_remove(struct platform_device *pdev)
 {
-       gpio_set_value(GPIO92_HX4700_HP_DRIVER, 0);
-       gpio_set_value(GPIO107_HX4700_SPK_nSD, 0);
-
-       gpio_free_array(hx4700_audio_gpios, ARRAY_SIZE(hx4700_audio_gpios));
+       gpiod_set_value(gpiod_hp_driver, 0);
+       gpiod_set_value(gpiod_spk_sd, 0);
        return 0;
 }
