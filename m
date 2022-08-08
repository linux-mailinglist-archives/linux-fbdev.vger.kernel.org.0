Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F077758C54A
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Aug 2022 11:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241930AbiHHJKY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 8 Aug 2022 05:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbiHHJKX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 8 Aug 2022 05:10:23 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC866583
        for <linux-fbdev@vger.kernel.org>; Mon,  8 Aug 2022 02:10:22 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id e127so12637608yba.12
        for <linux-fbdev@vger.kernel.org>; Mon, 08 Aug 2022 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=2ER2WW01ET2wH1WV2jGlyhputEhjwKA2tNpxchjmONE=;
        b=BXONmG4NT7Ps0k3vlwo+5xQkbC0wR7bD23e2Idydv5gt4/tkSJ5iIaQb0wq3ab/A+a
         aUL4zwLj5a1eyo3a+CLSLsCb3hAaSxhjIyJ1vgl5GpaYgi5OC2bqFCXv/cD6netBbbX6
         Tx3nJqFmDlXHOgv/8N53WShK1xRedTz7YizG0EQ+d6+Zn54cQnePxEwSsvpJ9Bm2kAh6
         rcy4zTsy5gz0KNlNIf7ZoxH4nRwifKu05WcmJrn6aJtL3dAK08hL8lPgIfWygcqSGBwi
         VkO6uLjjD9F5LS5eaiWYQOwnj8jaKMC8wLjTgmKV972zelkc2S0ha0Lb+w+BtCW4FQGH
         9qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=2ER2WW01ET2wH1WV2jGlyhputEhjwKA2tNpxchjmONE=;
        b=ngxKTjUxNtWDazP3CBnjV6Iv0mhO8ve3tSfVIRTrfe4BG4zvTH5xKORLKG5aud5YQw
         JaRijsSapV+f+EhidK2shRRlAWjWit1JyRr85qMWr+3txp8ubb3Q4PjJMVY/DXCaq6i9
         W0JBix+zRQwZY51wW6siJnbrw+AnCi06vmjWfng5tnpd8HWdRo/nDTFg8jfGMT0ZjT9L
         64ui+AioDEGP+bsiTKwSv7H5eNP95y3DTl1mIwHQBdG1sw4wWbk+Y9L7eRbgp1S520jL
         D+wUoh+L5lMUrsaR/5Yn6wBC21sX8sXxLDLBtkHQucA1x/bU9oxP+f5qZ4laxNAEhf1e
         lLMg==
X-Gm-Message-State: ACgBeo3Dg6Y35/0bfPy5pp7WPpi2QZdUZfvPzrj0byhojPKGKOG0IyS3
        2yNQ0NDId58IEk4fPaEv26oHuzPvH/ab2LGcz3k=
X-Google-Smtp-Source: AA6agR6ww8LBWAcj4WbUTZx9wZCglfi8vTK455s3Sjg/D48I0T3JlccLImfEudV5PbJMV3GB6lWP8FnqDqG6iWKcIFQ=
X-Received: by 2002:a05:6902:690:b0:67b:af6b:bc92 with SMTP id
 i16-20020a056902069000b0067baf6bbc92mr9677412ybt.459.1659949821415; Mon, 08
 Aug 2022 02:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4a9c:b0:18e:7ed4:6c87 with HTTP; Mon, 8 Aug 2022
 02:10:21 -0700 (PDT)
Reply-To: Drlisawilliams919@gmail.com
From:   Drlisawilliams <grahamkhudori@gmail.com>
Date:   Mon, 8 Aug 2022 11:10:21 +0200
Message-ID: <CAOPDNSG+QRY9xPP8WKYA6+BxbOe-x_QGsyRVE9MG-w8RHz5yVQ@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Dear,

My name is Dr Lisa Williams from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks
With love
Lisa
