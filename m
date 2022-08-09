Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D9158D323
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Aug 2022 07:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiHIFZh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Aug 2022 01:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiHIFZg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 Aug 2022 01:25:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0189186D1
        for <linux-fbdev@vger.kernel.org>; Mon,  8 Aug 2022 22:25:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c17so15557224lfb.3
        for <linux-fbdev@vger.kernel.org>; Mon, 08 Aug 2022 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MN/PfmZxhZGkUDtNPw5NWgDuHq3bhLxgM7464BOCO7A=;
        b=XZrgPN9JLTKg8atSdFLRTYNXR78mzwUKGoKE9+m3YvMPYebYYnJTS2thkWjAOgWbk5
         Gp59g/B0MEDTGRnUhfBxEFnRud/VlvToqjXrovIy0Www+xC4rMQN3M3WlpGAbdXu09r6
         ZpdXLzv7X/df/4F54dEYXnKNlQcjkeSqIKEs9oRRrN9KDCqhEqsNKlPW5qpnFWxw93a2
         fD6udybTtwWNYP6Qi8hXEoBOF9+yyEZKAkAw1EcPulVs4hk6FaEf1LKr6fnW8Y4DVqPe
         7HU6MNS2/1x5Zi85kq9xobr759btcJdBQJgsSBzQgBwkk/zspIwOMZRYwN818GbG+x2+
         T5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MN/PfmZxhZGkUDtNPw5NWgDuHq3bhLxgM7464BOCO7A=;
        b=DS3HBm7zHcTGGt0a04dBz4pIWk72z9o1Wk5SOwVqHB0LqeFUOZwOsUsjcM/Vb5d9FT
         TuKYiJNiJWEowh0lN0EuV6200IUTX0wF6ZqHAu7cq009lEXy3NaVI/cEaWAscR8ga6eZ
         1rd5tO30luuOlSMYWmxOQcxMbmnbb1LIiSrqbzSIB+TikIm9SZWbiDa9kYS5ggNF3Efb
         QZ0ft3eo9cQgwQdG3vgFlTUCbA2P0+D8jToWZ7B8akRDys9VvoI6frVBazmwqNtFNeYB
         9cdLrgLYDvRgo+/W9a0gdrWeenkbHWSvvstcHvq/8E6YfRpS+xrIhCwyopX3o7eemqxx
         5jZw==
X-Gm-Message-State: ACgBeo34HAxymC4jBNoLn9bg1HK/pwr1KqcChnAki9l/KwlZJxEksBdr
        XfAXBZzTHrRd6WBp8GLCauekPg==
X-Google-Smtp-Source: AA6agR6hw1vEdUjRQW20Lnu2pJAqZx/55rR0g6ua4dI5DTsbMqQXBvmrnt/fWy/9kP3zcmoMbyohMQ==
X-Received: by 2002:a05:6512:3b85:b0:48b:36d0:6cde with SMTP id g5-20020a0565123b8500b0048b36d06cdemr7082766lfv.247.1660022732045;
        Mon, 08 Aug 2022 22:25:32 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id j3-20020a056512344300b0048a921664e8sm1632860lfr.37.2022.08.08.22.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 22:25:31 -0700 (PDT)
Message-ID: <c6b890b6-e72f-0377-f0ae-cd15d29c23a1@linaro.org>
Date:   Tue, 9 Aug 2022 08:25:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few
 stale maintainers cleanup
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>,
        Robert Jones <rjones@gateworks.com>,
        Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808115202.3175eb1f@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808115202.3175eb1f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 08/08/2022 21:52, Jakub Kicinski wrote:
> On Mon,  8 Aug 2022 13:47:07 +0300 Krzysztof Kozlowski wrote:
>> Several of the bindings here had only one
>> maintainer and history does not always point to a new one (although I did not
>> perform extensive digging). I added subsystem maintainer, because dtschema
>> requires such entry. This is not the best choice as simply subsystem maintainer
>> might not have the actual device (or its datasheets or any interest in it).
>>
>> However dtschema requires a maintainer. Maybe we could add some
>> "orphaned" entry in such case?
> 
> Integrating it with MAINTAINERS would be another option worth exploring
> although slightly tangential.
> 
> How do you want this merged? It's all over the place subsystem-wise.

I was thinking this could go via Rob's tree as fixes for current cycle,
so your Ack would be great. If there is preference, I can split it per
subsystem, but for such trivial updates it's a bit of a churn.


Best regards,
Krzysztof
