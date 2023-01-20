Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252186754CA
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Jan 2023 13:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjATMln (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Jan 2023 07:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjATMlm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Jan 2023 07:41:42 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F59E1BC2
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Jan 2023 04:41:41 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3605720wmq.0
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Jan 2023 04:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9XjszmF/8qhTNMVuwNrRvWRLQzv4zG/c00mk2PH32o=;
        b=zwYVWKeymyLDPGAhMwebRVizSWIuFyjkJQGM7f7yQ8reSiP+lA0ujMEGQuyugAGhY7
         iKSap2wY46XvmlGSQkNI+nIyCkpJE1YXRlXJv8IIHqA4CGlLtavZwSZN4m8wzIE9KQ1Z
         S1NDMEjEgDKAGH252dUZgKDcLruOR5VlBLMWLr36t2YC3V2JJkfIGaLajrIeo4mxYCer
         BME8ng65YAtSoXL4GPNZBZDOqOLIu5hw5UL2OHFPc2HDxBR1S8pWRdR0fOaviH1tpbvO
         FXiCdRmbxOVoFv3e+qb30PGkkoSGslp/SVzL4FpYSKVq7odm46JnOwo/zjTVS+agBEgr
         wqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9XjszmF/8qhTNMVuwNrRvWRLQzv4zG/c00mk2PH32o=;
        b=q0qGn2GTUwhrfYyjkqNabz09MHx9bQMDNqua97UFgkyV1YuqH1ZvcRXUtbssaZjZXu
         kaov7Ij0tMMVcjq4Gly9A6gQB7WJNBP3FafV0+0O4lI4IJGw8ClhPLzGyunxgAMzXxOU
         pCm320kiqahtIkNUh8x89r/pHqF8giFZd2jVOJl/h1PxpS3ubk2GJJXu1asNKItPmm5t
         ob4mBiFTK6Swv4ShZezARjNoT3Qhwm/jf6NjErqDJsJEBIHF4+87gcv1/DxnLnBNBW6E
         +88WYmbqn+dBkzE+RIXXIixNvCgG9+7gM1Cjm7JvUe03HLvoxeB+hFdCbdAJJvAzvCNR
         16Gg==
X-Gm-Message-State: AFqh2krf29732/akUnMjrTXsKAQKdaJ4jlFqhjhLdo8KWh0JJcqq1l56
        y1npAznF++9fKbfLN8NvJUWjwQ==
X-Google-Smtp-Source: AMrXdXtCnq9tonQJY2m5G5BpVoNm8ayoj+6Kt5jmzGEGo3iBBKKX+GncF/gsCodgvhIMAjlMrRZcRQ==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id n6-20020a05600c4f8600b003db066ecfddmr12768043wmq.9.1674218499637;
        Fri, 20 Jan 2023 04:41:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bc043000000b003d1d5a83b2esm2163940wmc.35.2023.01.20.04.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 04:41:39 -0800 (PST)
Message-ID: <858a06e9-1141-4b1e-cd8c-75ca70330fc2@linaro.org>
Date:   Fri, 20 Jan 2023 13:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Helge Deller <deller@gmx.de>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20230120123857.16124-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120123857.16124-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 20/01/2023 13:38, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

