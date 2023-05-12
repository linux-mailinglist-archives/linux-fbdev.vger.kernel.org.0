Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43BC6700CEC
	for <lists+linux-fbdev@lfdr.de>; Fri, 12 May 2023 18:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjELQZF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 12 May 2023 12:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjELQZE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 12 May 2023 12:25:04 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5864696
        for <linux-fbdev@vger.kernel.org>; Fri, 12 May 2023 09:25:03 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4348416ae45so5756898137.3
        for <linux-fbdev@vger.kernel.org>; Fri, 12 May 2023 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683908703; x=1686500703;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=hedvTSKTehchw+3YCIzv/jI6Qg7WJgnGHvdO82fj4TjGHwkemI/DDMUemjMmHjVVnL
         KNhL2F2gyTQBlbhtJJob0QsVrl1msWK13Di8QwDNJSkxiuSLx5bxHW/NMEzssBmXnUaF
         N+haInF4OX7KBaQpc7DAvLxi3T0jw5mB2pdlvs+7+f5UY514zAwD46Wbii4HZvSUYdId
         RCCDa7WK2M4Y9wbNNaB49asPKcc8rd0MYukNz2WDPafVJEtJBTn8IM+1uTSnFl2k//NV
         b9iD1lS6OMcBZN2o8CWkswVjn7NfRl+j3wYPQPYIzR5qgc9H8B+eJZUbgyiEs9lROPHh
         43tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908703; x=1686500703;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=eTQ+UVSfyerdFXGfqnYwMbpZQJ7VIp5zxVsP9VfSqGXNPe3Q1tde+ncTObpqBB3TQR
         vsM6iJms0nW1FaMJnxdI7D5JX6mv5SraL+HMsFXVd7jidBFYNusDa0Ag7TW+ZTWG4hV5
         /JC8nLtAFVgbw19sQ/7KUBRbx2a7sKudYLeVR7KL0O3k6IlNx10CPhk8gzxsAUAi1T4s
         QQjbpek6pXyXdYxMuqVpWEMC9gBopJMxZ+ur7SXgdUcZ7DtMFaPMV9Sv5jldJwoaHvhr
         sB7MRfEGlq49gtdUFLY7CfLL1ep38YCYgeDguHXy35z1d9Wm/LZX23wkDTCk6IiP3ad1
         ZC+g==
X-Gm-Message-State: AC+VfDxmyM5YEEMR0SqoaPq4sosrl1xYsYUcO0vTHDLECRZasd71MxPL
        JsUceFrRMcZ4qch73l0JIj94iG0MK2aSLCr3LJA=
X-Google-Smtp-Source: ACHHUZ5bMPc7vo8JnhawMRjyHVESgw0FA4lUgaqD/jCbrD/e7pbfVG89iIzbRVneVCM5h4vMCAzTtc+WaEEvluf6Tr4=
X-Received: by 2002:a05:6102:40b:b0:434:8b9a:96d9 with SMTP id
 d11-20020a056102040b00b004348b9a96d9mr9425434vsq.30.1683908702929; Fri, 12
 May 2023 09:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c123:0:b0:3ca:d30:d5e with HTTP; Fri, 12 May 2023
 09:25:02 -0700 (PDT)
Reply-To: pmichae7707@gmail.com
From:   paul michael <pm3768072@gmail.com>
Date:   Fri, 12 May 2023 17:25:02 +0100
Message-ID: <CACMckHYA_aZ=NrzsQj9yUS==Kqsi22oN7JVEQUaxLWmuaJ-=1w@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
