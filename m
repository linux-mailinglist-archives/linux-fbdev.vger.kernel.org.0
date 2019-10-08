Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDCA1D023E
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Oct 2019 22:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbfJHUjN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Oct 2019 16:39:13 -0400
Received: from mx3.ucr.edu ([138.23.248.64]:10581 "EHLO mx3.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730720AbfJHUjM (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 8 Oct 2019 16:39:12 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 16:39:12 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570567152; x=1602103152;
  h=mime-version:from:date:message-id:subject:to;
  bh=Ov+TaJEUL5MZ2MuVlEdFPUX9o96HuIazEg8XGXB2Y+Y=;
  b=D3CBUUnDAB8GVAW+g+YjoXdiLC658hHVkrUF1OYcI6ggw2fYxxXz1Axb
   UAkQoIP2oKVXtMZydAUl1YsU+btbxjyigpfnGwTK53bbGL57GWYhGl8J0
   EWZeB7MDfceMcr+8w6BhF9TJYlymMNOF3sxh5mLeqreB9bSiLl6P7juhR
   erkV+ZL0ZWg6cDyawt7mZ1zID2esXJdVRRxlztRv1zvFdbAvP7J/ezrGL
   NbK0AEbCjfs3OVSzcvdlzkUdx9u3mZBCzB3z9jEUvwZJzFOg/Ml4DMNEa
   t2UnfC4kzNN1hdwJ1InX92DnKIaOj2KHmjy6pUHMsythzF2muJUNT2ps4
   A==;
IronPort-SDR: v+d2v9rynHeE1abDNLQepNeHQR0Ubme7jtxL4n+hevqSXRH7g8vLl0a3lkOm2XAGu9AdumoOvH
 fNr0iQpdRhQSFk9Ld3nxXdyF0Xqji5lMjDTgv64unlanbcY41MWqq7K8N3KK3vNZz0tvQ9NLtT
 0tyxZhEVRDOz+rQ4qGV76YyMYucWBuicphHMn5QApaFV4/NYyvJFctQFsyDZsHj71hDY+DI4Qg
 bJlTK5Kj1ZGC7PeCcdeQ2UG9kkNMmhava/ysKv0b5SEdOr8eLrWcelGyXoIWfvl/f77Pfa02jX
 szU=
IronPort-PHdr: =?us-ascii?q?9a23=3A6cuIsxVyM1kr4rc4tSfJ3GRim8HV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYbByBt8tkgFKBZ4jH8fUM07OQ7/m7HzFRqs/c6TgrS99lb1?=
 =?us-ascii?q?c9k8IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUh?=
 =?us-ascii?q?rwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9IRmrowjdrMkbjI9tJqosyh?=
 =?us-ascii?q?bFv2ZDdvhLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2TqFWASo/PW?=
 =?us-ascii?q?wt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WS?=
 =?us-ascii?q?in4qx2RhLklDsLOjgk+2zMlMd+kLxUrw6gpxxnwo7bfoeVNOZlfqjAed8WXH?=
 =?us-ascii?q?dNUtpNWyBEBI63cokBAPcbPetAoIbzp1UAoxijCweyGOzi0SNIimPs0KEmz+?=
 =?us-ascii?q?gtDQPL0Qo9FNwOqnTUq9D1Ob8QXuC0zajIzSjDb/RL0jj+6IjHaBEhquyLUL?=
 =?us-ascii?q?NwcMvRyVMgFwLZglmMp4HoJC6V2fgXs2SB8eVvSP+vhnchpgpsoTav3t8hhp?=
 =?us-ascii?q?fVio8R0FzJ9iV0zJwrKdGkS0N3e8OoHZ9SuiycKoB4WNktQ3tytyY/0rAGvJ?=
 =?us-ascii?q?m7czUUx5k/3B7fbuCHc5CP4hL+SOadOTd4i2xheLK4nxuy9FKvyuz4VsWt1F?=
 =?us-ascii?q?ZKrDdJnsDCtnwQ0xHe6NKLSvR6/kem1jaP0x7c5vtYLkAzkKrXM58hwrgumZ?=
 =?us-ascii?q?oPqUnPADP6lUHsgKKVdkgo4Pak5/jkb7n8u5ORM415hhn7Mqs0m8y/Beo4Mh?=
 =?us-ascii?q?IJX2ie4em91Lzi/U3jT7VLkvE6jqfUvYvHJcsHvK61GRFa3Zs+6xqnFTepzM?=
 =?us-ascii?q?wYnWUbLFJCYB+Hi4npO1fTIPH3FPu/jU+jnyp1yPDYJbDhHJrNIWbZkLv7fr?=
 =?us-ascii?q?Zy9VRcyAwtwtBb/Z5UDasBIP2gEnP24fbRFAM9NAm1zuSvOtJ50IITQ2GOD7?=
 =?us-ascii?q?CYO7Ga5VXO9OUrJeiBfowUtR7mIv0++vjhy3Q+nAlZNaWz3N4bZW61GtxiIl?=
 =?us-ascii?q?6FejzimNoMHWoRvRY5VKrtklLGGTpSYWuiGqw26jwlIJypAJ2FRY23hrGFmi?=
 =?us-ascii?q?ChEdkeYmFAF0DJEnrycYiAc+kDZTjUIcJ7lDEAE7+7RNwPzxar4T772bp6Ka?=
 =?us-ascii?q?Lm+iQZ/cbyxth85rWLzjkv/iYyAsiAhTLeB1pol38FEmdllJt0plZwnxLaif?=
 =?us-ascii?q?B1?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EcAwBN8Zxdh8XQVdFmgkGEEIRNjmK?=
 =?us-ascii?q?FFwGGeIZxiDmBewEIAQEBDi8BAYcIIzYHDgIDCQEBBQEBAQEBBQQBAQIQAQE?=
 =?us-ascii?q?BCA0JCCmFQII6KQGDVRF8AwwCJgIkEgEFASIBNIMAgguiFIEDPIsmgTKIZgE?=
 =?us-ascii?q?JDYFIEnoojA6CF4Rhh1KCWASBOQEBAZUvllcBBgKCEBSMVIhFG4IqAZcVji2?=
 =?us-ascii?q?ZTw8jgTYDgggzGiV/BmeBT08QFIFpjkwkkUQBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EcAwBN8Zxdh8XQVdFmgkGEEIRNjmKFFwGGeIZxiDmBe?=
 =?us-ascii?q?wEIAQEBDi8BAYcIIzYHDgIDCQEBBQEBAQEBBQQBAQIQAQEBCA0JCCmFQII6K?=
 =?us-ascii?q?QGDVRF8AwwCJgIkEgEFASIBNIMAgguiFIEDPIsmgTKIZgEJDYFIEnoojA6CF?=
 =?us-ascii?q?4Rhh1KCWASBOQEBAZUvllcBBgKCEBSMVIhFG4IqAZcVji2ZTw8jgTYDgggzG?=
 =?us-ascii?q?iV/BmeBT08QFIFpjkwkkUQBAQ?=
X-IronPort-AV: E=Sophos;i="5.67,272,1566889200"; 
   d="scan'208";a="86080509"
Received: from mail-lj1-f197.google.com ([209.85.208.197])
  by smtp3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Oct 2019 13:32:05 -0700
Received: by mail-lj1-f197.google.com with SMTP id w26so4554053ljh.9
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Oct 2019 13:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Y5uvD0KVI1iYImauUvxo4V9KaiRqMOMx+KR5+x6L9WM=;
        b=fecPbdmerWj/bWPiJDHaPx+hhxOnJR3byaFRbWcteErpBIdC60sKTEc/XpFsBxoFAU
         bCwzJM6cqrp7M5jLzIKxb5t5OGsoa8A+gSyW5rl7FJNbYOTfhqM+F2B7j5I6VinBak32
         Jkqss6YZd/zMNIrcNC8ehVwZMdxszrXcJa50ZuLaS/QLzIgwOyTbiJtUc12N1FGRusBK
         ZbKwsD7rv+OBNcGgX0hni95LHg2w+PhoK2njv34Wvq8KDVuRcwXrIW8ng795mN2AQVBU
         zfVSgmOoSj+ZaUv29irp6bFfiCNTqSJ3M4YU4tLtXaoYH8VuoBvleUHA7SmmmdW9NKwy
         w0wA==
X-Gm-Message-State: APjAAAUFanaqFu4c/VHN4q9KfAI6vUPYMAT4IMXnMlGue/IWGWfSUWNg
        H6OaP7mHqe00WOLMBbtVe8j9cYOzrG2u9Ns0Hbldg+95NkR9tWUhnI7aTJdNGo/yyPQiWwR5cHX
        uM5zYVcNChOAmiM2Wq39fMSnMi+ivo2zNKBoQ4dUv
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr22257161lfm.67.1570566723358;
        Tue, 08 Oct 2019 13:32:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKXb5GhB8uOBl0EocLC+TY8jhaYV0Q9PE/EonJZ2i5JDTwYHHUoHWPpSFGT7Ou1l0SIUv9Vaan38rSSzyLys0=
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr22257148lfm.67.1570566723127;
 Tue, 08 Oct 2019 13:32:03 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Tue, 8 Oct 2019 13:32:45 -0700
Message-ID: <CABvMjLRE_Nxa1jC1o9uw_jsuAABdm+nE0ZNu-yh0hMzmfqEr_g@mail.gmail.com>
Subject: Uninitialized Variable Use in video: fbdev: pm3fb
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi All:

drivers/video/fbdev/pm3fb.c:

Inside function pm3fb_write_mode(),  variable "m" "n" "p" could leave
uninitialized after pm3fb_calculate_clock(), however, they are used
later in PM3_WRITE_DAC_REG, which is potentially unsafe.


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
